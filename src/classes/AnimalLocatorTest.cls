@isTest
private class AnimalLocatorTest {
		@isTest 
    	static void testPostCallout() {
            // Set mock callout class 
            Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
            // This causes a fake response to be sent
            // from the class that implements HttpCalloutMock. 
            String animalName = AnimalLocator.getAnimalNameById(2);
            // Verify that the response received contains fake values
            System.debug('animal name='+animalName);
            
        }
}