public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer arrayLength){
        
        List<String> listOfStrings = new List<String>();
        
        for(Integer i=0;i<arrayLength;i++) {
			listOfStrings.add('Test ' + i);
            System.debug(listOfStrings.get(i));
        }
        
        System.debug(listOfStrings);
        return listOfStrings;
    }

}