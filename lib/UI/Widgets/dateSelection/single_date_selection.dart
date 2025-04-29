import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:flutter/services.dart';

class SingleBookingDateselection extends StatefulWidget {
  const SingleBookingDateselection({super.key});

  @override
  State<SingleBookingDateselection> createState() =>
      _SingleBookingDateselectionState();
}

class _SingleBookingDateselectionState
    extends State<SingleBookingDateselection> {
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
        inputFormatters: [DateInputFormatter()],
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
        keyboardType: TextInputType.number,
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
