import 'package:flutter/material.dart';

class CounterPill extends StatefulWidget {
  final Function(int)? onRoomCountChanged;

  const CounterPill({
    super.key,
    this.onRoomCountChanged,
  });

  @override
  State<CounterPill> createState() => _CounterPillState();
}

class _CounterPillState extends State<CounterPill> {
  int counter = 0;
  final TextEditingController _controller = TextEditingController(text: "0");

  void _updateCounter(int newValue) {
    if (newValue < 0) return; 
    setState(() {
      counter = newValue;
      _controller.text = counter.toString();
    });
    widget.onRoomCountChanged?.call(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0XFFFAFFFF),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFFE2E2E2),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {
              _updateCounter(counter - 1);
            },
            icon: const Icon(Icons.remove),
          ),
          SizedBox(
            width: 35,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (value) {
                final parsed = int.tryParse(value);
                if (parsed != null) {
                  _updateCounter(parsed);
                }
              },
              onTap: () {
                _controller.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _controller.text.length,
                );
              },
            ),
          ),

          IconButton(
            onPressed: () {
              _updateCounter(counter + 1);
            },
            icon: const Icon(Icons.add),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
