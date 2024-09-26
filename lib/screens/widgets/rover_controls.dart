import 'package:flutter/material.dart';
import 'package:mars_rover_mission/models/rover.dart';
import 'package:mars_rover_mission/screens/widgets/command_controls.dart';
import 'package:mars_rover_mission/screens/widgets/compass.dart';

class RoverControls extends StatefulWidget {
  const RoverControls({
    super.key,
    required this.rover,
    required this.roverStatus,
    required this.onExcecuteCommands,
    required this.stateManagment,
  });

  final Rover rover;
  final String roverStatus;
  final void Function(String commandsString) onExcecuteCommands;
  final String stateManagment;

  @override
  RoverControlsState createState() => RoverControlsState();
}

class RoverControlsState extends State<RoverControls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mars Rover Mission with ${widget.stateManagment}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.roverStatus,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            CommandControls(
              rover: widget.rover,
              onExcecuteCommands: widget.onExcecuteCommands,
            ),
            const SizedBox(height: 20),
            Compass(rover: widget.rover),
          ],
        ),
      ),
    );
  }
}
