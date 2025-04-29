import 'package:flutter/material.dart';

  class CounterPill extends StatefulWidget {
  final Function(int)? onRoomCountChanged; // 👈 Add this callback

  const CounterPill({
    super.key,
    this.onRoomCountChanged,  // 👈 Add this to the constructor
  });

  @override
  State<CounterPill> createState() => _CounterPillState();
}

class _CounterPillState extends State<CounterPill> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0XFFFAFFFF),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Color(0xFFE2E2E2),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Spacer(),
          IconButton(
            onPressed: () {
              if (counter > 0) {
                setState(() {
                  counter--;
                });
                widget.onRoomCountChanged?.call(counter); // 👈 Call the callback when counter changes
              }
            },
            icon: Icon(Icons.remove),
          ),
          Text("$counter"),
          IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
              widget.onRoomCountChanged?.call(counter); // 👈 Call the callback when counter changes
            },
            icon: Icon(Icons.add),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
