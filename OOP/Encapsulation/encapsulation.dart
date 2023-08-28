void main(List<String> args) {
  Robot redRobot = Robot();
  redRobot.name = 'Red Robot';
  redRobot.color = RobotColor.red;
  // setup serial number
  redRobot.serialNumber = 1234;
  print(
      'Robot name: ${redRobot.name}, color: ${redRobot.color}, serial number: ${redRobot.serialNumber}');

  Robot greenRobot = Robot();
  greenRobot.name = 'Green Robot';
  greenRobot.color = RobotColor.green;
  // no serial number set up
  print(
      'Robot name: ${greenRobot.name}, color: ${greenRobot.color}, serial number: ${greenRobot.serialNumber}');
}

enum RobotColor { red, green, blue, undefined }

class Robot {
  String? _name;
  RobotColor? _color;
  int? _serialNumber;

  String get name => _name ?? 'No name';
  RobotColor get color => _color ?? RobotColor.undefined;
  int get serialNumber => _serialNumber ??= generateSerialNumber();

  set name(String value) => _name = value;
  set color(RobotColor value) => _color = value;
  set serialNumber(int value) => _serialNumber = value;

  generateSerialNumber() {
    return serialNumber = DateTime.now().millisecondsSinceEpoch;
  }
}
