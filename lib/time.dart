import 'package:flutter/material.dart';

class Time1 extends StatefulWidget {
  const Time1({super.key});

  @override
  State<Time1> createState() => _Time1State();
}

class _Time1State extends State<Time1> {
  final TimeOfDay _currentTime = TimeOfDay.now();

  //Time
  String? _selectedTime;
  Future<void> _show() async {
    final TimeOfDay? result =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Current Time: ${_currentTime.format(context)}",
            style: const TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            _selectedTime != null ? _selectedTime! : '',
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton.icon(
              onPressed: () {
                _show();
              },
              icon: const Icon(Icons.punch_clock),
              label: const Text("Time")),
        ]),
      ),
    );
  }
}
