import 'package:flutter/material.dart';

class DatePickerDialogTest1 extends StatefulWidget {
  const DatePickerDialogTest1({super.key});

  @override
  State<DatePickerDialogTest1> createState() => _DatePickerDialogTest1State();
}

class _DatePickerDialogTest1State extends State<DatePickerDialogTest1> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
        appBar: AppBar(
          title: const Text("DatePickerDialogTest1"),
        ),
        body: ElevatedButton(
            onPressed: () {
              showDatePicker(
                  context: context,
                  firstDate: selectedDate,
                  lastDate: selectedDate.add(const Duration(days: 30)
                  )
              );
            },
            child: const Text("Date Picker")));
  }
}
