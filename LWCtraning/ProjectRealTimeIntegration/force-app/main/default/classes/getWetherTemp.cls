public class getWetherTemp {
    @AuraEnabled
    public static WeatherDetailsWrapper getWeatherDetails(String cityName){
        //Fram the EndPoint URL
        String apiKey = 'ac34b13425b55916fa6c4ea27934478c';
        String EndPoint = 'https://home.openweathermap.org/data/2.5/weather';
        endpoint +='?q='+cityName;
        endpoint +='&units=metric';
        endpoint +='&APPID='+apiKey;
        System.debug('endpoint URL'+endpoint);
    

    //callout to wether API
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpoint);
    req.setMethod('GET');
    HttpResponse res = http.send(req);
    system.debug('res '+res+ ' body '+JSON.deserializeUntyped(res.getBody()));

    //return the weatherb dateils in wrapper from
    WeatherDetailsWrapper weatherDet = new WeatherDetailsWrapper();
    if(res.getStatusCode() == 200){
           Map<String,object> result = (Map<String,Object>)JSON.deserializeUntyped(res.getBody());
           weatherDet.city = String.valueOf(result.get('name'));
           Map<String,object> mainResult = (Map<String,object>)result.get('main');
           weatherDet.temperature = string.valueOf(mainResult.get('temp'));
           weatherDet.pressure = string.valueOf(mainResult.get('pressure'));
           weatherDet.humidity = string.valueOf(mainResult.get('humidity'));
           weatherDet.fellsLike = string.valueOf(mainResult.get('feels_like'));
           weatherDet.tempMin = string.valueOf(mainResult.get('temp_min'));
           weatherDet.tempMax = string.valueOf(mainResult.get('temp_max'));
           
    }
    system.debug('weatherDet '+weatherDet);
    return weatherDet;

    }

    //Wrapper Class to store wether details in serial manner
    Public class WeatherDetailsWrapper{
        @AuraEnabled public String city{get;set;}
        @AuraEnabled public String temperature{get;set;}
        @AuraEnabled public String pressure{get;set;}
        @AuraEnabled public String humidity{get;set;}
        @AuraEnabled public String fellsLike{get;set;}
        @AuraEnabled public String tempMin{get;set;}
        @AuraEnabled public String tempMax{get;set;}
  
    }
}