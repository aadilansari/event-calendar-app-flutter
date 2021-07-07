import 'package:flutter/material.dart';
import 'package:machinetest/dateitem.dart';
import 'package:machinetest/eventform.dart';
import 'package:machinetest/rowitem.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Events'),
    );
  }
}

class Events {
  String title;
  String description;
  String time;
  int day;
  String month;
  int year;
  Events(
      this.title, this.description, this.time, this.day, this.month, this.year);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime date = new DateTime.now();
  String selectedMonth;
  int selectedYear;
  int selectedDay;
  List<Events> eventList = [];
  List<int> dates = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> monthswith31days = [
    "Jan",
    "Mar",
    "May",
    "Jul",
    "Aug",
    "Oct",
    "Dec"
  ];

  List<String> monthswith30days = [
    "Apr",
    "Jun",
    "Sep",
    "Nov",
  ];

  List<int> years = [for (var i = 2016; i <= 2025; i++) i];

  int getNoOfDays(String month) {
    return (month == 'Feb'
        ? 28
        : monthswith30days.contains(month)
            ? 30
            : 31);
  }

  void onSave(String time, String title, String description) {
    eventList.add(Events(
        title, description, time, selectedDay, selectedMonth, selectedYear));
    setState(() {
      eventList = eventList;
    });
  }

  @override
  void initState() {
    selectedYear = date.year;
    selectedMonth = DateFormat("MMM").format(date);
    setState(() {
      dates = [for (int i = 1; i <= getNoOfDays(selectedMonth); i++) i];
    });

    super.initState();
  }

  InkWell _buildItemsForDateListView(BuildContext context, int index) {
    var event = eventList
        .where((element) =>
            element.day == dates[index] &&
            element.year == selectedYear &&
            element.month == selectedMonth)
        .toList();
    print(event);
    return InkWell(
        onTap: () => {
              onDaySelect(dates[index]),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventForm(
                      dates[index], selectedMonth, selectedYear, onSave),
                ),
              )
            },
        child: Container(
            child: DateItem(
                dates[index],
                selectedMonth,
                event.length > 0 ? event[0].title : null,
                event.length > 0
                    ? event[0].time +
                        " " +
                        event[0].day.toString() +
                        "-" +
                        event[0].month +
                        "-" +
                        event[0].year.toString()
                    : null)));
  }

  RowItem _buildItemsForMonthListView(BuildContext context, int index) {
    return RowItem(months[index], 0, onMonthSelect);
  }

  RowItem _buildItemsForYearListView(BuildContext context, int index) {
    return RowItem(null, years[index], onYearSelect);
  }

  onYearSelect(int year) {
    setState(() {
      selectedYear = year;
    });
  }

  onMonthSelect(String month) {
    setState(() {
      selectedMonth = month;
      dates = [for (int i = 1; i <= getNoOfDays(month); i++) i];
    });
  }

  onDaySelect(int day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          // context and builder are
                          // required properties in this widget
                          context: context,
                          builder: (BuildContext context) {
                            // we set up a container inside which
                            // we create center column and display text
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey[300])),
                                    ),
                                    child: Text(
                                      "Year",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: _buildItemsForYearListView,
                                        itemCount: years.length),
                                    // child: DateItem(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        selectedYear == null ? "Year" : selectedYear.toString(),
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(2, 0, 2, 0)),
                  Expanded(
                    child: RaisedButton(
                      child: Text(
                          selectedMonth == null ? "Month" : selectedMonth,
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      color: Colors.blue,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Colors.grey[300])),
                                    ),
                                    child: Text(
                                      "Month",
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                        physics: BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            _buildItemsForMonthListView,
                                        itemCount: months.length),
                                    // child: DateItem(),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: _buildItemsForDateListView,
                      itemCount: dates.length),
                  // child: DateItem(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
