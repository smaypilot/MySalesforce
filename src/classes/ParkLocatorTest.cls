@isTest
public class ParkLocatorTest {
    
    @isTest
    static void testParkLocator(){
        
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        Test.startTest();
        String[] parks = ParkLocator.country('Germany');
        System.debug('parks'+parks);
        
    }

}