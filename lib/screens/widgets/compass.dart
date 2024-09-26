import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mars_rover_mission/models/rover.dart';

class Compass extends StatelessWidget {
  const Compass({super.key, required this.rover});
  final Rover rover;

  @override
  Widget build(BuildContext context) {
    return _buildCompass();
  }

  Widget _buildCompass() {
    TextStyle getCompassTextStyle(Direction direction) {
      return TextStyle(
        fontWeight:
            direction == rover.direction ? FontWeight.bold : FontWeight.normal,
        color: direction == rover.direction ? Colors.black : Colors.grey,
      );
    }

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Rover is facing:'),
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'N',
                    style: getCompassTextStyle(Direction.N),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'S',
                    style: getCompassTextStyle(Direction.S),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'W',
                    style: getCompassTextStyle(Direction.W),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'E',
                    style: getCompassTextStyle(Direction.E),
                  ),
                ),
                Center(child: Arrow(direction: rover.direction)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Arrow extends StatelessWidget {
  const Arrow({super.key, required this.direction});

  final Direction direction;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _getAngleFromDirection(),
      child: const Icon(Icons.arrow_forward),
    );
  }

  /// Se utiliza [pi] para representar ángulos de 180 grados ([pi] radianes) y 90 grados ([pi]/2 radianes), que son ángulos comunes en geometría y trigonometría. Al utilizar [pi], se puede expresar estos ángulos de manera exacta y precisa en el código.
  double _getAngleFromDirection() {
    switch (direction) {
      case Direction.N:
        return -pi / 2;
      case Direction.S:
        return pi / 2;
      case Direction.E:
        return 0;
      case Direction.W:
        return pi;
    }
  }
}
