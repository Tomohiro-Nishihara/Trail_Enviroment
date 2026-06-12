public with sharing class Constructor_Example
{
    Private String name = 'John Doe';
    Public void Constructor_Example(String xxxx)
    {
        name = xxxx;
        system.debug('The name is: ' + name);
    }
    Public void Constructor_Example()
    {
        system.debug('The name is: ' + name);
    }
}