import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'contract_term.dart';

void main() {
  runApp(new ContractTermCalc());
}

// will not change
class ContractTermCalc extends StatefulWidget {
  @override
  _ContractTermCalc createState() => new _ContractTermCalc();
}

// will change
class _ContractTermCalc extends State<ContractTermCalc> {
  // This block of variables could be defined first and then set in _MyAppState Constructor
  // May be a more elegant way of doing things
  // Also newContract and formatter should be private variables

  ContractTerm newContract = new ContractTerm();
  DateFormat formatter = new DateFormat('EEEE, d MMMM yyyy');

  final Color _kdrDarkBlue = Color.fromRGBO(18, 57, 100, 1.0);
  final Color _kdrLightBlue = Color.fromRGBO(13, 170, 221, 1.0);
  final Color _kdrGrey = Color.fromRGBO(128, 128, 128, 1.0);

  String para1 = "2018-08-28";
  String para2 = "2018-09-25";
  String para3 = "8.0";

  String _title = "Working Days Calculator";

  void _pressed(String startDate) {
    setState(() {
      // Add user input values to newContract
      newContract.startDate = DateTime.parse(startDate);
      newContract.endDate = DateTime.parse(para2);
      newContract.hoursPerDay = double.parse(para3);

      // Calculate values for newContract
      newContract.calculateTotals();

      // Display newContract
      newContract.displayContract();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: _title,
      home: new Scaffold(
        backgroundColor: _kdrDarkBlue,
        appBar: new AppBar(
          title: new Text(_title),
          backgroundColor: _kdrDarkBlue,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.refresh),
                onPressed: () {
                  _pressed("2018-01-28");
                }),
            new IconButton(
                icon: new Icon(Icons.save),
                onPressed: () {
                  _pressed("2018-02-27");
                }),
            new IconButton(
                icon: new Icon(Icons.people),
                onPressed: () {
                  _pressed("2018-03-28");
                }),
          ],
        ),
        body: new Container(
            padding: const EdgeInsets.all(8.0),
            child: new ListView(
              children: <Widget>[
                new Card(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: newContract.tempContractInputs())),
                new Card(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: newContract.displayContract())),
              ],
            )),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            _pressed("2018-04-28");
          },
          tooltip: 'Increment',
          child: new Icon(Icons.save),
        ),
      ),
    );
  }
}
