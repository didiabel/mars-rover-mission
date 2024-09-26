import 'package:flutter/material.dart';
import 'package:mars_rover_mission/screens/provider/rover_provider.dart';
import 'package:provider/provider.dart';
import 'package:mars_rover_mission/screens/widgets/rover_controls.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoverProvider(),
      child: Consumer<RoverProvider>(
        builder: (context, roverProvider, child) {
          return RoverControls(
            stateManagment: 'Provider',
            rover: roverProvider.rover,
            roverStatus: roverProvider.roverStatus,
            onExcecuteCommands: (commandsString) {
              try {
                roverProvider.executeCommands(commandsString);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString()),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
