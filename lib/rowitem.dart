import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  var month;
  var year;
  Function onclick;
  RowItem(this.month, this.year, this.onclick);

  void ontap() {
    onclick(month == null ? year : month);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.grey[300])),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              month == null ? year.toString() : month,
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ),
        ),
      ),
      onTap: ontap,
    );
  }
}
