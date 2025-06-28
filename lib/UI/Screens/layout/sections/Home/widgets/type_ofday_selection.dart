import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingTypeSelectorWidget extends StatefulWidget {
  final ValueChanged<int> onTypeSelected; // Change to accept int type
  final int initialType;

  const BookingTypeSelectorWidget({
    super.key,
    required this.onTypeSelected,
    this.initialType = 1, // Default is 1 for "Day Cruise"
  });

  @override
  State<BookingTypeSelectorWidget> createState() =>
      _BookingTypeSelectorWidgetState();
}

class _BookingTypeSelectorWidgetState extends State<BookingTypeSelectorWidget> {
  late int selectedType;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialType; // Initialize with the passed type
  }

  void _selectType(int type) {
    setState(() {
      selectedType = type;
    });
    widget.onTypeSelected(type); // Pass the selected type (1 or 2)
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0XFFFAFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          _buildOption(1, "Day Cruise"), // 1 for Day Cruise
          _buildOption(2, "Full Day Cruise"), // 2 for Full Cruise
        ],
      ),
    );
  }

  Widget _buildOption(int type, String label) {
    bool isSelected = selectedType == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => _selectType(type),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0XFFFAFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.black12,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.ubuntu(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
