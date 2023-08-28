void main(List<String> args) {
  Soldier soldier1 = Soldier(BroadSword());
  Soldier soldier2 = Soldier(Dagger());

  soldier1.attackEnemy(LightEnemy());
  soldier2.attackEnemy(HeavyEnemy());
}

abstract class WeaponAbstract {
  void attack(Enemy enemy);
}

abstract class Enemy {
  int _health = 100;

  int get health => _health;

  takeDamage(int damage) {
    _health = _health - damage;
  }
}

class HeavyEnemy implements Enemy {
  int _health = 200;

  int get health => _health;

  takeDamage(int damage) {
    _health = _health - damage;
  }
}

class LightEnemy implements Enemy {
  int _health = 50;

  int get health => _health;

  takeDamage(int damage) {
    _health = _health - damage;
  }
}

class BroadSword implements WeaponAbstract {
  int attackPower = 10;
  void attack(Enemy enemy) {
    enemy.takeDamage(attackPower);
  }
}

class Dagger implements WeaponAbstract {
  int attackPower = 5;
  void attack(Enemy enemy) {
    enemy.takeDamage(attackPower);
  }
}

class Soldier {
  WeaponAbstract weapon;

  Soldier(this.weapon);

  attackEnemy(Enemy enemy) {
    weapon.attack(enemy);
    print('remaining enemy health: ${enemy.health}');
  }
}
