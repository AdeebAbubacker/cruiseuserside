import 'package:flutter/material.dart';

class BookingSelectionWidget extends StatefulWidget {
  const BookingSelectionWidget({super.key});

  @override
  State<BookingSelectionWidget> createState() => _BookingSelectionWidgetState();
}

class _BookingSelectionWidgetState extends State<BookingSelectionWidget> {
  String selectedCruise = "Premium";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0XFFFAFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Stack(
        children: [
          // Render the unselected option first
          if (selectedCruise == "Premium") _buildFullCruiseOption(),
          if (selectedCruise == "Deluxe") _buildDayCruiseOption(),

          // Render the selected option last to bring it to the top
          if (selectedCruise == "Premium") _buildDayCruiseOption(),
          if (selectedCruise == "Deluxe") _buildFullCruiseOption(),
        ],
      ),
    );
  }

  Widget _buildDayCruiseOption() {
    return Positioned(
      left: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCruise = "Premium";
          });
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 2 - 5,
          decoration: BoxDecoration(
            color: Color(0XFFFAFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedCruise == "Premium" ? Colors.blue : Colors.black12,
            ),
            boxShadow: selectedCruise == "Premium"
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
            "Premium",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: selectedCruise == "Premium" ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFullCruiseOption() {
    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCruise = "Deluxe";
          });
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 2 - 5,
          decoration: BoxDecoration(
            color: Color(0XFFFAFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedCruise == "Deluxe" ? Colors.blue : Colors.black12,
            ),
            boxShadow: selectedCruise == "Deluxe"
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
            "Deluxe",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: selectedCruise == "Deluxe" ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
