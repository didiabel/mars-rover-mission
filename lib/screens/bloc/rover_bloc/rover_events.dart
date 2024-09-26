import 'package:equatable/equatable.dart';

abstract class RoverEvent extends Equatable {
  const RoverEvent();

  @override
  List<Object?> get props => [];
}

class ExecuteCommands extends RoverEvent {
  final String commandsString;

  const ExecuteCommands(this.commandsString);

  @override
  List<Object?> get props => [commandsString];
}
