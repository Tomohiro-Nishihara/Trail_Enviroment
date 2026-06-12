public with sharing class Mapping_Service {
    
    Integer distance = 1;
    
    public void calculateDistance(){
        system.debug('Calculating distance...' + distance);
    }
    
}