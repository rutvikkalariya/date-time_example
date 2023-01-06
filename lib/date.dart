import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date1 extends StatefulWidget {
  const Date1({super.key});

  @override
  State<Date1> createState() => _Date1State();
}

class _Date1State extends State<Date1> {
  // DateTime datetime = DateTime.now();
  // String datetime1 = DateFormat("yyyy-MM-dd").format(aDateTime);
  // String datetime2 = DateFormat.Hms().format(datetime);
  // String datetime3 = DateFormat.MMMMEEEEd().format(datetime);
  // String year = datetime.year.toString();
  // String month = datetime.month.toString();
  // String hour = datetime.hour.toString();
  // String minute = datetime.minute.toString();
  // String second = datetime.second.toString();

//DateTime object
  DateTime currentDate = DateTime.now();
//Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentDate.toString(),
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton.icon(
              onPressed: () {
                _selectDate(context);
              },
              icon: const Icon(Icons.calendar_month),
              label: const Text("Date"),
            ),
          ],
        ),
      ),
    );
  }
}
