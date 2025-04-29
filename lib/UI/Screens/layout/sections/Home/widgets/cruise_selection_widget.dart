import 'package:flutter/material.dart';

class CruiseSelectionWidget extends StatefulWidget {
  final ValueChanged<String> onCruiseSelected;
  const CruiseSelectionWidget({super.key, required this.onCruiseSelected});

  @override
  State<CruiseSelectionWidget> createState() => _CruiseSelectionWidgetState();
}

class _CruiseSelectionWidgetState extends State<CruiseSelectionWidget> {
  String selectedCruise = "Day Cruise";

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
          if (selectedCruise == "Day Cruise") _buildFullCruiseOption(),
          if (selectedCruise == "Full Cruise") _buildDayCruiseOption(),

          // Render the selected option last to bring it to the top
          if (selectedCruise == "Day Cruise") _buildDayCruiseOption(),
          if (selectedCruise == "Full Cruise") _buildFullCruiseOption(),
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
            selectedCruise = "Day Cruise";
          });
          widget.onCruiseSelected(selectedCruise);
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 2 - 5,
          decoration: BoxDecoration(
            color: Color(0XFFFAFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color:
                  selectedCruise == "Day Cruise" ? Colors.blue : Colors.black12,
            ),
            boxShadow: selectedCruise == "Day Cruise"
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
            "Day Cruise",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  selectedCruise == "Day Cruise" ? Colors.blue : Colors.black,
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
            selectedCruise = "Full Cruise";
          });
          widget.onCruiseSelected(selectedCruise);
        },
        child: Container(
          height: 48,
          width: MediaQuery.of(context).size.width / 2 - 5,
          decoration: BoxDecoration(
            color: Color(0XFFFAFFFF),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selectedCruise == "Full Cruise"
                  ? Colors.blue
                  : Colors.black12,
            ),
            boxShadow: selectedCruise == "Full Cruise"
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
            "Full Cruise",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  selectedCruise == "Full Cruise" ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
