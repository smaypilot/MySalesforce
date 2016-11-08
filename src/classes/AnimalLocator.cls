public class AnimalLocator {
    
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + id);
        request.setMethod('GET');
        String animalName = null;
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){
            Map<String, Object> serviceResults = (Map<String, Object>)JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animal = (Map<String, Object>)serviceResults.get('animal');
            animalName = (String)animal.get('name');
            
        } 
        return animalName;
        
    }
}