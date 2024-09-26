import 'package:flutter/material.dart';
import 'package:mars_rover_mission/models/rover.dart';

class RoverProvider extends ChangeNotifier {
  Rover _rover = Rover(0, 0, Direction.S, 200);
  String _roverStatus = 'Enter commands to move the rover';

  Rover get rover => _rover;
  String get roverStatus => _roverStatus;

  void executeCommands(String commandsString) {
    try {
      _rover = _rover.readAndExecuteCommands(commandsString);
      _roverStatus = 'Rover has moved to: (${_rover.x}, ${_rover.y})';
      notifyListeners();
    } catch (e) {
      _roverStatus = (e as dynamic).message;
      notifyListeners();
      rethrow;
    }
  }
}
