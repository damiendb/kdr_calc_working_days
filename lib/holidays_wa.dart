/*

create a class for public holidays
this class has a constructor that takes start and end dates as parameters
constructor builds list of public holidays in the period (based on Global List)
constructor calculates the number of holidays in the period
add a dispose() function to clear out the memory
add a test() function with assert() statements and a super.test() if using class extensions

 */

// Global List of all Public Holidays
List<Holidays> pubHolidayList = populateHolidays("WA", 3);

// Class for keeping dates ranges of Holidays
class Holidays {
  DateTime pubHoliday;
  String holDescription;
}

// Build out the global variable containing Public Holidays
List<Holidays> populateHolidays(String stateAUS, int years) {
  List<Holidays> holidays = new List<Holidays>();

  if (stateAUS == "WA") {
    for (int i = 0; i < years * 10; i++) {
      holidays.insert(i, addHolidayWestAus(i));
    }
  }
  return holidays;
}

Holidays addHolidayWestAus(int index) {
  Holidays indDay = new Holidays();

  switch (index) {

    // Public Holidays in 2018

    case 0:
      indDay.pubHoliday = new DateTime(2018, 01, 01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 1:
      indDay.pubHoliday = new DateTime(2018, 01, 26);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 2:
      indDay.pubHoliday = new DateTime(2018, 03, 05);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 3:
      indDay.pubHoliday = new DateTime(2018, 03, 30);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 4:
      indDay.pubHoliday = new DateTime(2018, 04, 02);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 5:
      indDay.pubHoliday = new DateTime(2018, 04, 25);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 6:
      indDay.pubHoliday = new DateTime(2018, 06, 04);
      indDay.holDescription = "WA Day";
      return indDay;
    case 7:
      indDay.pubHoliday = new DateTime(2018, 09, 24);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 8:
      indDay.pubHoliday = new DateTime(2018, 12, 25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 9:
      indDay.pubHoliday = new DateTime(2018, 12, 26);
      indDay.holDescription = "Boxing Day";
      return indDay;

    // Public Holidays in 2019
    case 10:
      indDay.pubHoliday = new DateTime(2019, 01, 01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 11:
      indDay.pubHoliday = new DateTime(2019, 01, 28);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 12:
      indDay.pubHoliday = new DateTime(2019, 03, 04);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 13:
      indDay.pubHoliday = new DateTime(2019, 04, 19);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 14:
      indDay.pubHoliday = new DateTime(2019, 04, 22);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 15:
      indDay.pubHoliday = new DateTime(2019, 04, 25);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 16:
      indDay.pubHoliday = new DateTime(2019, 06, 03);
      indDay.holDescription = "WA Day";
      return indDay;
    case 17:
      indDay.pubHoliday = new DateTime(2019, 09, 30);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 18:
      indDay.pubHoliday = new DateTime(2019, 12, 25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 19:
      indDay.pubHoliday = new DateTime(2019, 12, 26);
      indDay.holDescription = "Boxing Day";
      return indDay;

    // Public Holidays in 2020
    case 20:
      indDay.pubHoliday = new DateTime(2020, 01, 01);
      indDay.holDescription = "New Years Day";
      return indDay;
    case 21:
      indDay.pubHoliday = new DateTime(2020, 01, 27);
      indDay.holDescription = "Australia Day";
      return indDay;
    case 22:
      indDay.pubHoliday = new DateTime(2020, 03, 02);
      indDay.holDescription = "Labour Day";
      return indDay;
    case 23:
      indDay.pubHoliday = new DateTime(2020, 04, 10);
      indDay.holDescription = "Good Friday";
      return indDay;
    case 24:
      indDay.pubHoliday = new DateTime(2020, 04, 13);
      indDay.holDescription = "Easter Monday";
      return indDay;
    case 25:
      indDay.pubHoliday = new DateTime(2020, 04, 27);
      indDay.holDescription = "ANZAC Day";
      return indDay;
    case 26:
      indDay.pubHoliday = new DateTime(2020, 06, 01);
      indDay.holDescription = "WA Day";
      return indDay;
    case 27:
      indDay.pubHoliday = new DateTime(2020, 09, 28);
      indDay.holDescription = "Queen's Birthday";
      return indDay;
    case 28:
      indDay.pubHoliday = new DateTime(2020, 12, 25);
      indDay.holDescription = "Christmas Day";
      return indDay;
    case 29:
      indDay.pubHoliday = new DateTime(2020, 12, 28);
      indDay.holDescription = "Boxing Day";
      return indDay;
  }

  return indDay;
}
