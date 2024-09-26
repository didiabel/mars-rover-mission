import 'package:equatable/equatable.dart';
import 'package:mars_rover_mission/models/rover.dart';

abstract class RoverState extends Equatable {
  final Rover rover;
  final String roverStatus;

  const RoverState(this.rover, this.roverStatus);

  @override
  List<Object?> get props => [rover, roverStatus];
}

class RoverUpdatedState extends RoverState {
  const RoverUpdatedState(super.rover, super.roverStatus);
}

class RoverErrorState extends RoverState {
  const RoverErrorState(super.rover, super.roverStatus);
}
