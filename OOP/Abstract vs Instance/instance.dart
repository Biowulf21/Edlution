void main(List<String> args) {
  Person bob = Person(name: 'Bob', age: 20, favoriteThing: FavoriteThing.music);
  Person james =
      Person(name: 'James', age: 30, favoriteThing: FavoriteThing.food);
  Person kendra =
      Person(name: 'Kendra', age: 40, favoriteThing: FavoriteThing.travel);

  bob.sayHello();
  james.sayHello();
  kendra.sayHello();
}

enum FavoriteThing { music, food, travel }

extension getShortString on FavoriteThing {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

class Person {
  String name;
  int age;
  FavoriteThing favoriteThing;

  Person({required this.name, required this.age, required this.favoriteThing});

  void sayHello() {
    print(
        'Hello, my name is $name, I am $age years old. My favorite thing is ${favoriteThing.toShortString()}.');
  }
}
