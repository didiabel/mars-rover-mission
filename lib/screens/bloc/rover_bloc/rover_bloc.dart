import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/models/rover.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_events.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_states.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  RoverBloc()
      : super(
          RoverUpdatedState(Rover(0, 0, Direction.S, 200), 'Enter commands'),
        ) {
    on<ExecuteCommands>((event, emit) {
      try {
        final updatedRover =
            state.rover.readAndExecuteCommands(event.commandsString).copyWith();

        emit(RoverUpdatedState(
          updatedRover,
          'Rover has moved to: (${updatedRover.x}, ${updatedRover.y})',
        ));
      } catch (e) {
        emit(RoverErrorState(state.rover, e.toString()));
      }
    });
  }
}
