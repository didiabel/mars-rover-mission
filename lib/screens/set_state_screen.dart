import 'package:flutter/material.dart';
import 'package:mars_rover_mission/models/rover.dart';
import 'package:mars_rover_mission/screens/widgets/rover_controls.dart';

class SetStateScreen extends StatefulWidget {
  const SetStateScreen({super.key});

  @override
  State<SetStateScreen> createState() => _SetStateScreenState();
}

class _SetStateScreenState extends State<SetStateScreen> {
  Rover rover = Rover(0, 0, Direction.S, 200);
  String roverStatus = 'Enter commands to move the rover';

  @override
  Widget build(BuildContext context) {
    return RoverControls(
      stateManagment: 'setState',
      rover: rover,
      roverStatus: roverStatus,
      onExcecuteCommands: (commandsString) {
        try {
          final Rover updatedRover =
              rover.readAndExecuteCommands(commandsString);

          setState(() {
            rover = updatedRover;
            roverStatus =
                'Rover has moved to: (${updatedRover.x}, ${updatedRover.y})';
          });
        } catch (e) {
          setState(() {
            roverStatus = (e as dynamic).message;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
            ),
          );
        }
      },
    );
  }
}
