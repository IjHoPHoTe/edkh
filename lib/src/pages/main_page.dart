import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MonthPickerScreen(),
    );
  }
}

class MonthPickerScreen extends StatefulWidget {
  const MonthPickerScreen({Key? key}) : super(key: key);

  @override
  State<MonthPickerScreen> createState() => _MonthPickerScreenState();
}

class _MonthPickerScreenState extends State<MonthPickerScreen> {
  String showMonth = 'Select Month';
  int _selectedMonth = DateTime.now().month;
  int _selectedYear = DateTime.now().year;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  void _updateSelectedMonth(int month) {
    setState(() {
      _selectedMonth = month;
      showMonth = months[month - 1];
    });
  }

  void _selectYear(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(_selectedYear, _selectedMonth),
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
    );

    if (pickedDate != null &&
        pickedDate != DateTime(_selectedYear, _selectedMonth)) {
      setState(() {
        _selectedYear = pickedDate.year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(showMonth),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '$showMonth $_selectedYear',
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () {
                  _selectYear(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
