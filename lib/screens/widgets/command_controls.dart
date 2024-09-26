import 'package:flutter/material.dart';
import 'package:mars_rover_mission/models/rover.dart';

class CommandControls extends StatelessWidget {
  CommandControls({
    super.key,
    required this.rover,
    required this.onExcecuteCommands,
  });
  final Rover rover;
  final void Function(String commandsString) onExcecuteCommands;
  final TextEditingController commandInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Enter Commands (f, l, r)',
            border: OutlineInputBorder(),
          ),
          controller: commandInputController,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => onExcecuteCommands(commandInputController.text),
          child: const Text('Send Commands'),
        ),
      ],
    );
  }
}
