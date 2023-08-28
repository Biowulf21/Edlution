void main(List<String> args) {
  Fish goldFish = new Fish();
  print(goldFish.move());

  Bird eagle = new Bird();
  print(eagle.move());

  Robot<String> stringWorker = Robot<String>();
  stringWorker.doWork("Happy Birthday");

  Robot<int> intWorker = Robot<int>();
  intWorker.doWork(2910);
}

// This is my first example of polymorphism
abstract class AnimalAbstract {
  String move();
}

class Fish implements AnimalAbstract {
  @override
  String move() {
    return "Swim";
  }
}

class Bird implements AnimalAbstract {
  @override
  String move() {
    return "Fly";
  }
}

// Since there is no method overloading in dart, I will use optional parameters using Dart generics
// Documentation link: https://dart.dev/language/generics
abstract class RobotAbstract<T> {
  void doWork(T job);
}

class Robot<T> implements RobotAbstract<T> {
  @override
  void doWork(T job) {
    if (job is String) {
      print('I am singing $job');
    } else if (job is int) {
      print("I am counting $job");
    } else {
      print("I don't know what to do");
    }
  }
}
