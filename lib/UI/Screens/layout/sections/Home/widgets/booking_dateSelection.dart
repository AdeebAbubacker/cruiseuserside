import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/services.dart';

class BookingDateselection extends StatefulWidget {
  const BookingDateselection({super.key});

  @override
  _BookingDateselectionState createState() => _BookingDateselectionState();
}

class _BookingDateselectionState extends State<BookingDateselection> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        // Format date as day/month/year
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: _dateController,
        style: TextStyles.ubuntu14black55w400,
        inputFormatters: [DateInputFormatter()], // Use custom formatter
        decoration: InputDecoration(
          hintText: "Please Choose or Enter a Date",
          hintStyle: TextStyles.ubuntu14black55w400,
          labelStyle: TextStyles.ubuntu14black55w400,
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
                    });
                  },
                ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
        ),
        keyboardType: TextInputType.number, // Number keyboard for easier input
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

    // Remove any slashes to simplify formatting logic
    String cleanText = text.replaceAll('/', '');

    // Format the text with slashes
    String formattedText = '';
    for (int i = 0; i < cleanText.length; i++) {
      if (i == 2 || i == 4) {
        formattedText += '/';
      }
      formattedText += cleanText[i];
    }

    // Restrict the text to a maximum of 10 characters (dd/MM/yyyy)
    if (formattedText.length > 10) {
      formattedText = formattedText.substring(0, 10);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
