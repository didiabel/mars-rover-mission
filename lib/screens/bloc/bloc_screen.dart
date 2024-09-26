import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_bloc.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_events.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_states.dart';
import 'package:mars_rover_mission/screens/widgets/rover_controls.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoverBloc(),
      child: BlocConsumer<RoverBloc, RoverState>(
        listener: (context, state) {
          if (state is RoverErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.roverStatus)),
            );
          }
        },
        builder: (context, state) {
          return RoverControls(
            stateManagment: 'BLoC',
            rover: state.rover,
            roverStatus: state.roverStatus,
            onExcecuteCommands: (commandsString) {
              BlocProvider.of<RoverBloc>(context)
                  .add(ExecuteCommands(commandsString));
            },
          );
        },
      ),
    );
  }
}
