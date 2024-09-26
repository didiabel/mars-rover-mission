import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_rover_mission/models/rover.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_events.dart';
import 'package:mars_rover_mission/screens/bloc/rover_bloc/rover_states.dart';

class RoverBloc extends Bloc<RoverEvent, RoverState> {
  Rover rover = Rover(0, 0, Direction.S, 200);

  RoverBloc()
      : super(RoverUpdatedState(
            Rover(0, 0, Direction.S, 200), 'Enter commands')) {
    on<ExecuteCommands>((event, emit) {
      try {
        rover = rover.readAndExecuteCommands(event.commandsString);
        emit(RoverUpdatedState(
          rover,
          'Rover has moved to: (${rover.x}, ${rover.y})',
        ));
      } catch (e) {
        emit(RoverErrorState(state.rover, e.toString()));
      }
    });
  }
}
