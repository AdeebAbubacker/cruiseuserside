import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiplebookingDateselection extends StatefulWidget {
  const MultiplebookingDateselection({super.key});

  @override
  State<MultiplebookingDateselection> createState() =>
      _MultiplebookingDateselectionState();
}

class _MultiplebookingDateselectionState
    extends State<MultiplebookingDateselection> {
  final TextEditingController _dateController = TextEditingController();

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? pickedRange = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedRange != null) {
      setState(() {
        startDate = pickedRange.start;
        endDate = pickedRange.end;

        _dateController.text =
            "${_formatDate(startDate)} - ${_formatDate(endDate)}";
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: _dateController,
        style: TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          hintText: "Please Choose or Enter a Date Range",
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.55)),
          labelStyle: TextStyle(fontSize: 14, color: Colors.black),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_dateController.text.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _dateController.clear();
                      startDate = DateTime.now();
                      endDate = DateTime.now();
                    });
                  },
                ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDateRange(context);
                },
              ),
            ],
          ),
        ),
        readOnly: true,
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    String cleanText = text.replaceAll('/', '');

    String formattedText = '';
    for (int i = 0; i < cleanText.length; i++) {
      if (i == 2 || i == 4) {
        formattedText += '/';
      }
      formattedText += cleanText[i];
    }

    if (formattedText.length > 10) {
      formattedText = formattedText.substring(0, 10);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
