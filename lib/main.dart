import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'contract_term.dart';

void main() {
  runApp(new MyApp());
}

// will not change
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

// will change
class _MyAppState extends State<MyApp> {
  ContractTerm newContract = new ContractTerm();
  DateFormat formatter = new DateFormat('EEEE, d MMMM yyyy');

  String para1 = "2018-08-28";
  String para2 = "2018-09-25";
  String para3 = "8.0";

  String _title = "Working Days Calculator";
  String _myState = "No State";

  void _pressed(String message, String startDate) {
    setState(() {
      // Add user input values to newContract
      newContract.startDate = DateTime.parse(startDate);
      newContract.endDate = DateTime.parse(para2);
      newContract.hoursPerDay = double.parse(para3);

      // Calculate values for newContract
      newContract.calculateTotals();

      // Display newContract
      newContract.displayContract();

      _myState = message;
    });
    print(_myState);
  }

  @override
  Widget build(BuildContext context) {
    // it's okay to insert code here
    // this is run every tme setState() is called!!
    print("*****  BUILDING ******");

    return new MaterialApp(
      title: _title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_alert),
                onPressed: () {
                  _pressed("Alert Pressed", "2018-01-28");
                }),
            new IconButton(
                icon: new Icon(Icons.print),
                onPressed: () {
                  _pressed("Print Pressed", "2018-02-27");
                }),
            new IconButton(
                icon: new Icon(Icons.people),
                onPressed: () {
                  _pressed("People Pressed", "2018-03-28");
                }),
            new RaisedButton(
                child: new Text("Button"),
                onPressed: () {
                  _pressed("Super Button of Doom", "2018-04-28");
                }),
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(32.0),
            child: new Center(
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                  new Text(_myState),
                  new Text(" "),
                  new Text("First Day of Contract: " +
                      //    newContract.startDate.toString()),
                      formatter.format(newContract.startDate)),
                  new Text("Last Day of Contract: " +
                      //    newContract.endDate.toString()),
                      formatter.format(newContract.endDate)),
                  new Text(
                      "Hours per Day: " + newContract.hoursPerDay.toString()),
                  new Text(" "),
                  new Text("Number of Public Holidays during Contract: " +
                      newContract.totalHolidays.toString()),
                  new Text("Number of Days during Contract: " +
                      newContract.totalDays.toString()),
                  new Text("Number of Week Days during Contract: " +
                      newContract.totalWeekDays.toString()),
                  new Text("Number of Working Days during Contract: " +
                      newContract.totalWorkingDays.toString()),
                  new Text("Number of Working Hours during Contract: " +
                      newContract.totalWorkingHours.toString()),
                  new Text(" ")
                ]))),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _pressed("Super Button of Doom", "2018-04-28");
          },
          tooltip: 'Increment',
          child: new Icon(Icons.save),
        ),
      ),
    );
  }
}
