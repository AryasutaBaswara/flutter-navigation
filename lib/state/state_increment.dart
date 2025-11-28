abstract class State_increment {}

class State_increment_initial extends State_increment {}

class State_increment_update extends State_increment {
  final int number;
  State_increment_update(this.number);
}
