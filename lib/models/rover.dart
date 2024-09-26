enum Direction { N, S, E, W }

enum Command { f, l, r }

class Rover {
  int x = 0;
  int y = 0;
  Direction direction = Direction.S;

  Rover(this.x, this.y, this.direction, int gridSize);

  Rover copyWith({int? x, int? y, Direction? direction, int? gridSize}) {
    return Rover(
      x ?? this.x,
      y ?? this.y,
      direction ?? this.direction,
      gridSize ?? 200,
    );
  }

  Rover readAndExecuteCommands(String input) {
    final commands = _parseCommands(input);
    return _executeCommands(commands);
  }

  Rover _executeCommands(List<Command> commands) {
    for (var command in commands) {
      try {
        switch (command) {
          case Command.f:
            _moveForward();
            break;
          case Command.l:
            _turnLeft();
            break;
          case Command.r:
            _turnRight();
            break;
        }
      } catch (e) {
        rethrow;
      }
    }

    return this;
  }

  Map<int, int> _moveForward() {
    int newX = x;
    int newY = y;

    final exception =
        Exception('Rover is at the edge of the grid area and is at: ($x, $y)');

    switch (direction) {
      case Direction.N:
        newY = y - 1;

        if (newY > y || newY.isNegative) {
          throw exception;
        }
        break;
      case Direction.S:
        newY = y + 1;

        if (newY < y || newY > 200) {
          throw exception;
        }
        break;
      case Direction.E:
        newX = x + 1;

        if (newX < x || newX > 200) {
          throw exception;
        }
        break;
      case Direction.W:
        newX = x - 1;

        if (newX > x || newX.isNegative) {
          throw exception;
        }
        break;
    }

    x = newX;
    y = newY;

    return {x: y};
  }

  Direction _turnLeft() {
    direction = {
      Direction.N: Direction.W,
      Direction.W: Direction.S,
      Direction.S: Direction.E,
      Direction.E: Direction.N,
    }[direction]!;

    return direction;
  }

  Direction _turnRight() {
    direction = {
      Direction.N: Direction.E,
      Direction.E: Direction.S,
      Direction.S: Direction.W,
      Direction.W: Direction.N,
    }[direction]!;

    return direction;
  }

  List<Command> _parseCommands(String input) {
    return input.toLowerCase().split('').map((char) {
      switch (char) {
        case 'f':
          return Command.f;
        case 'l':
          return Command.l;
        case 'r':
          return Command.r;
        default:
          throw ArgumentError('Invalid command: $char');
      }
    }).toList();
  }
}
