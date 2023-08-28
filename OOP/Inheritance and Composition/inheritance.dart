import 'dart:math';

void main(List<String> args) {
  Cow cow = Cow();
  Lion lion = Lion();

  cow.sleep();
  cow.eat();
  print(cow.checkIfAlive());

  lion.sleep();
  lion.eat();
  print(lion.checkIfAlive());
}

class Animal {
  bool checkIfAlive() {
    return Random().nextBool();
  }

  sleep() {
    print('zzzzz');
  }

  eat() {
    print('The animal is eating');
  }
}

class Cow extends Animal {
  // notice how despite they have the same method called eat, they have different implementations. This is called method overriding.
  @override
  eat() {
    print('The cow is eating grass');
  }

  moo() {
    print('Mooooo');
  }
}

class Lion extends Animal {
  @override
  eat() {
    print('The lion is eating meat');
  }

  roar() {
    print('Roarrrr');
  }
}
