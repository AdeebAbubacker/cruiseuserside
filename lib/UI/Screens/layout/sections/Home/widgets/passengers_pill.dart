import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class PassengersPill extends StatefulWidget {
  final String image;
  final ValueChanged<int> onChanged;

  const PassengersPill({
    super.key,
    required this.image,
    required this.onChanged,
  });

  @override
  State<PassengersPill> createState() => _PassengersPillState();
}

class _PassengersPillState extends State<PassengersPill> {
  int counter = 0;
  final TextEditingController _controller = TextEditingController(text: "0");

  void _updateCounter(int newValue) {
    if (newValue < 0) return; 
    setState(() {
      counter = newValue;
      _controller.text = counter.toString();
      widget.onChanged(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
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
          const SizedBox(width: 15),
          SvgPicture.asset(widget.image),
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
