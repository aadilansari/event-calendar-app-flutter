import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  int date;
  String selectedMonth;
  int selectedYear;
  Function(String time, String title, String description) onEventSave;
  EventForm(this.date, this.selectedMonth, this.selectedYear, this.onEventSave);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  String time;
  String title;
  String description;
  String timeError;
  String titleError;
  String descriptionError;
  final TextEditingController timeController = new TextEditingController();

  void onSave() {
    try {
      if (time == null || time.isEmpty) {
        setState(() {
          timeError = 'Invalid Time';
        });
        throw 'Invalid Time';
      }
      if (title == null || title.isEmpty) {
        setState(() {
          titleError = 'Please add a title';
        });
        throw 'Invalid Title';
      }
      if (description == null || description.isEmpty) {
        setState(() {
          descriptionError = 'Please add a description';
        });
        throw 'Invalid Description';
      }
      widget.onEventSave(time, title, description);
      Navigator.pop(context);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 5, bottom: 5),
                child: TextButton(
                  onPressed: onSave,
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        leading: new TextButton(
            child: Text('Back', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Event Details'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10),
                        child: Text("Date & Time")),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 3.0, right: 8.0, top: 10),
                      child: TextFormField(
                        controller: timeController,
                        keyboardType: TextInputType.number,
                        validator: (totalexperienceval) =>
                            totalexperienceval.length < 1
                                ? "Please enter valid value"
                                : null,
                        onChanged: (text) {
                          setState(() {
                            time = text;
                            timeError = null;
                          });
                        },
                        maxLength: 5,
                        decoration: new InputDecoration(
                          hintText: "HH:MM",
                          filled: true,
                          errorText: timeError,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 10),
                        child: Text(widget.date.toString() +
                            "-" +
                            widget.selectedMonth +
                            "-" +
                            widget.selectedYear.toString())),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 30, top: 10),
                      child: Text("Title")),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 3.0, right: 8.0, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (totalexperienceval) =>
                            totalexperienceval.length < 1
                                ? "Please enter valid value"
                                : null,
                        onChanged: (text) {
                          setState(() {
                            title = text;
                            titleError = null;
                          });
                        },
                        decoration: new InputDecoration(
                          hintText: "",
                          errorText: titleError,
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          contentPadding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 30, top: 10, bottom: 0),
                child: Text(
                  "Description",
                  textAlign: TextAlign.start,
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 8.0, top: 0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (totalexperienceval) =>
                      totalexperienceval.length < 1
                          ? "Please enter valid value"
                          : null,
                  onChanged: (text) {
                    setState(() {
                      description = text;
                      descriptionError = null;
                    });
                  },
                  decoration: new InputDecoration(
                    hintText: "",
                    errorText: descriptionError,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: new EdgeInsets.fromLTRB(10, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
