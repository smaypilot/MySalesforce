@isTest
public class TestVerifyDate {

    
    @isTest
    static void CheckDatesWithin30DaysTest(){
        Date date1 = Date.newInstance(2016, 1, 1);
        Date date2 = Date.newInstance(2016, 1, 15);
        VerifyDate.CheckDates(date1, date2);
    }
    
    @isTest
    static void CheckDatesNotWithin30DaysTest(){
        Date date1 = Date.newInstance(2016, 1, 1);
        Date date2 = Date.newInstance(2016, 2, 15);
        VerifyDate.CheckDates(date1, date2);
    }
}