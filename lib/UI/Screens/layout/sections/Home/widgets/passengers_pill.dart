import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PassengersPill extends StatefulWidget {
  final String image;
  const PassengersPill({
    super.key,
    required this.image,
  });

  @override
  State<PassengersPill> createState() => _PassengersPillState();
}

class _PassengersPillState extends State<PassengersPill> {
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
          SizedBox(
            width: 15,
          ),
          SvgPicture.asset(widget.image),
          Spacer(),
          IconButton(
            onPressed: () {
              if (counter > 0) {
                setState(() {
                  counter--;
                });
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
            },
            icon: Icon(Icons.add),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
