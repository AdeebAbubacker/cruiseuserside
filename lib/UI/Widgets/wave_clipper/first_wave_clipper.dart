

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class FirstWaveClipper extends CustomClipper<Path> {
  final double waveProgress;
  final double waveHeight;
  final double phaseShift;

  FirstWaveClipper(this.waveProgress,
      {this.waveHeight = 20, this.phaseShift = 0});

  @override
  Path getClip(Size size) {
    final path = Path();
    final waveLength = size.width;

    // Calculate the dynamic vertical position
    double verticalPosition = lerpDouble(size.height * 0.98, -55, waveProgress)!;

    // Starting point
    path.moveTo(0, verticalPosition);

    for (double i = 0; i <= waveLength; i++) {
      double dx = i;
      double dy = sin((i / waveLength * 2.4 * pi) +
                  (waveProgress * 2 * pi) +
                  phaseShift) *
              waveHeight +
          verticalPosition;
      path.lineTo(dx, dy);
    }

    // end
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
