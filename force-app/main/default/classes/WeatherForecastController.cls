/**
 * WeatherForecastController
 * 
 * Apex controller for Weather Forecast LWC component.
 * Integrates with OpenWeatherMap API to fetch weather data.
 * 
 * NOTE: Requires Named Credential setup for OpenWeatherMap API
 */
public with sharing class WeatherForecastController {
    
    /**
     * Fetches current weather and 5-day forecast for a given city
     * @param city The name of the city to get weather for
     * @return JSON string containing current weather and forecast data
     */
    @AuraEnabled(cacheable=false)
    public static String getWeatherForecast(String city) {
        try {
            if (String.isBlank(city)) {
                throw new AuraHandledException('City name is required');
            }
            
            // Get API key from Custom Metadata or Named Credential
            // For this example, we'll use Named Credential
            String apiKey = getApiKey();
            
            if (String.isBlank(apiKey)) {
                throw new AuraHandledException('OpenWeatherMap API key not configured. Please set up Custom Metadata Type or Named Credential.');
            }
            
            // Fetch current weather
            Map<String, Object> currentWeather = getCurrentWeather(city, apiKey);
            
            // Get coordinates for forecast API
            Decimal lat = (Decimal)currentWeather.get('lat');
            Decimal lon = (Decimal)currentWeather.get('lon');
            
            // Fetch 5-day forecast
            List<Map<String, Object>> forecast = getFiveDayForecast(lat, lon, apiKey);
            
            // Combine results
            Map<String, Object> result = new Map<String, Object>{
                'current' => currentWeather,
                'forecast' => forecast
            };
            
            return JSON.serialize(result);
            
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching weather data: ' + e.getMessage());
        }
    }
    
    /**
     * Fetches current weather data
     */
    private static Map<String, Object> getCurrentWeather(String city, String apiKey) {
        String endpoint = 'callout:OpenWeatherMap/data/2.5/weather';
        endpoint += '?q=' + EncodingUtil.urlEncode(city, 'UTF-8');
        endpoint += '&units=metric';
        endpoint += '&appid=' + apiKey;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(120000);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            Map<String, Object> data = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            return parseCurrentWeather(data);
        } else {
            throw new CalloutException('Weather API returned error: ' + res.getStatusCode() + ' - ' + res.getBody());
        }
    }
    
    /**
     * Fetches 5-day forecast data
     */
    private static List<Map<String, Object>> getFiveDayForecast(Decimal lat, Decimal lon, String apiKey) {
        String endpoint = 'callout:OpenWeatherMap/data/2.5/forecast';
        endpoint += '?lat=' + lat;
        endpoint += '&lon=' + lon;
        endpoint += '&units=metric';
        endpoint += '&appid=' + apiKey;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setTimeout(120000);
        
        Http http = new Http();
        HttpResponse res = http.send(req);
        
        if (res.getStatusCode() == 200) {
            Map<String, Object> data = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            return parseForecastData(data);
        } else {
            throw new CalloutException('Forecast API returned error: ' + res.getStatusCode());
        }
    }
    
    /**
     * Parses current weather response
     */
    private static Map<String, Object> parseCurrentWeather(Map<String, Object> data) {
        Map<String, Object> main = (Map<String, Object>)data.get('main');
        Map<String, Object> wind = (Map<String, Object>)data.get('wind');
        Map<String, Object> sys = (Map<String, Object>)data.get('sys');
        Map<String, Object> coord = (Map<String, Object>)data.get('coord');
        List<Object> weatherList = (List<Object>)data.get('weather');
        Map<String, Object> weather = (Map<String, Object>)weatherList[0];
        
        return new Map<String, Object>{
            'city' => (String)data.get('name'),
            'country' => (String)sys.get('country'),
            'temp' => (Decimal)main.get('temp'),
            'description' => capitalizeFirstLetter((String)weather.get('description')),
            'icon' => (String)weather.get('icon'),
            'humidity' => (Integer)main.get('humidity'),
            'windSpeed' => (Decimal)wind.get('speed'),
            'lat' => (Decimal)coord.get('lat'),
            'lon' => (Decimal)coord.get('lon')
        };
    }
    
    /**
     * Parses forecast data and returns daily aggregated forecast
     */
    private static List<Map<String, Object>> parseForecastData(Map<String, Object> data) {
        List<Object> forecastList = (List<Object>)data.get('list');
        Map<String, Map<String, Object>> dailyForecasts = new Map<String, Map<String, Object>>();
        
        // Group by date and get midday forecast (12:00:00)
        for (Object item : forecastList) {
            Map<String, Object> forecast = (Map<String, Object>)item;
            String dateTimeStr = (String)forecast.get('dt_txt');
            
            // Only take 12:00:00 forecasts for each day
            if (dateTimeStr.contains('12:00:00')) {
                String dateStr = dateTimeStr.substring(0, 10);
                
                Map<String, Object> main = (Map<String, Object>)forecast.get('main');
                List<Object> weatherList = (List<Object>)forecast.get('weather');
                Map<String, Object> weather = (Map<String, Object>)weatherList[0];
                
                dailyForecasts.put(dateStr, new Map<String, Object>{
                    'date' => formatDate(dateStr),
                    'temp' => Math.round((Decimal)main.get('temp')),
                    'description' => capitalizeFirstLetter((String)weather.get('description')),
                    'icon' => (String)weather.get('icon'),
                    'iconUrl' => 'https://openweathermap.org/img/wn/' + weather.get('icon') + '@2x.png'
                });
            }
        }
        
        return dailyForecasts.values();
    }
    
    /**
     * Retrieves API key from Custom Metadata Type
     * You can also use Named Credential instead
     */
    private static String getApiKey() {
        // Option 1: Use Custom Metadata Type (recommended for storing API keys)
        // Uncomment and configure Custom Metadata Type: Weather_API_Config__mdt
        /*
        List<Weather_API_Config__mdt> configs = [
            SELECT API_Key__c 
            FROM Weather_API_Config__mdt 
            WHERE DeveloperName = 'OpenWeatherMap' 
            LIMIT 1
        ];
        return configs.isEmpty() ? '' : configs[0].API_Key__c;
        */
        
        // Option 2: For demo purposes, return empty string
        // In production, configure Named Credential or Custom Metadata
        return '';
    }
    
    /**
     * Capitalizes first letter of each word
     */
    private static String capitalizeFirstLetter(String input) {
        if (String.isBlank(input)) return input;
        
        List<String> words = input.split(' ');
        List<String> capitalized = new List<String>();
        
        for (String word : words) {
            if (word.length() > 0) {
                capitalized.add(word.substring(0, 1).toUpperCase() + word.substring(1));
            }
        }
        
        return String.join(capitalized, ' ');
    }
    
    /**
     * Formats date string (YYYY-MM-DD) to readable format
     */
    private static String formatDate(String dateStr) {
        List<String> parts = dateStr.split('-');
        if (parts.size() != 3) return dateStr;
        
        Map<String, String> months = new Map<String, String>{
            '01' => 'Jan', '02' => 'Feb', '03' => 'Mar', '04' => 'Apr',
            '05' => 'May', '06' => 'Jun', '07' => 'Jul', '08' => 'Aug',
            '09' => 'Sep', '10' => 'Oct', '11' => 'Nov', '12' => 'Dec'
        };
        
        return months.get(parts[1]) + ' ' + parts[2];
    }
}