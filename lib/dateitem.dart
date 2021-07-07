import 'package:flutter/material.dart';

class DateItem extends StatefulWidget {
  int date;
  String month;
  String time;
  String title;
  DateItem(this.date, this.month, this.title, this.time);
  @override
  _DateItemState createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[200])),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(right: BorderSide(width: 1.0, color: Colors.grey)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    widget.date.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    widget.month,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                    child: Text(widget.time == null ? '' : widget.time),
                  ),
                  Text(widget.title == null ? '' : widget.title)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
