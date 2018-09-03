import 'package:intl/intl.dart';

import 'holidays_wa.dart';

class ContractTerm {
  // Format used for printing dates to the screen
  DateFormat formatter = new DateFormat('EEEE, d MMMM yyyy');

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(new Duration(days: 7));
  double hoursPerDay = 7.5;

  List<Holidays> _inPeriodHolidays = new List<Holidays>();

  int totalDays = 0;
  int totalWeekDays = 0;
  int totalHolidays = 0;
  int totalWorkingDays = 0;
  double totalWorkingHours = 0.0;

  void calculateTotals() {
    this._inPeriodHolidays =
        holidaysInPeriod(pubHolidayList, this.startDate, this.endDate);
    this.totalDays = countTotalDays(this.startDate, this.endDate);
    this.totalWeekDays = countWeekDays(this.startDate, this.endDate);
    this.totalHolidays = this._inPeriodHolidays.length;
    this.totalWorkingDays = this.totalWeekDays - this.totalHolidays;
    this.totalWorkingHours = this.totalWorkingDays * this.hoursPerDay;
  }

  void displayContract() {
    print("First Day of Contract: " + formatter.format(this.startDate));
    print("Last Day of Contract: " + formatter.format(this.endDate));
    print("Hours per Day: " + this.hoursPerDay.toString());
    print("");

    this._inPeriodHolidays.forEach((value) {
      print(formatter.format(value.pubHoliday) + " is " + value.holDescription);
    });
    print("");

    print("Number of Public Holidays during Contract: " +
        this.totalHolidays.toString());
    print("Number of Days during Contract: " + this.totalDays.toString());
    print("Number of Week Days during Contract: " +
        this.totalWeekDays.toString());
    print("Number of Working Days during Contract: " +
        this.totalWorkingDays.toString());
    print("Number of Working Hours during Contract: " +
        this.totalWorkingHours.toString());
  }

  static List<Holidays> holidaysInPeriod(
      List<Holidays> pubHols, DateTime start, DateTime end) {
    int i = 0;

    // build the list containing just the applicable holidays for this period
    List<Holidays> inPeriodHolidays = new List<Holidays>();

    pubHols.forEach((value) {
      if (value.pubHoliday.isAfter(start.subtract(const Duration(days: 1))) &&
          value.pubHoliday.isBefore(end.add(const Duration(days: 1)))) {
        inPeriodHolidays.insert(i, value);
        i++;
      }
    });
    return inPeriodHolidays;
  }

  static int countTotalDays(DateTime start, DateTime end) {
    return end.difference(start).inDays + 1;
  }

  static int countWeekDays(DateTime start, DateTime end) {
    DateTime counterDay = start;
    int totalDays = 0;

    do {
      if (counterDay.weekday < 6) {
        totalDays++;
      }
      counterDay = counterDay.add(const Duration(days: 1));
    } while (counterDay.isBefore(end.add(const Duration(days: 1))));

    return totalDays;
  }
}
