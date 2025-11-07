abstract class Pet {
  String name;
  static int totalPets = 0;

  Pet(this.name) {
    totalPets++;
  }

  Pet.unnamed() : this.name = 'No Name' {
    totalPets++;
  }

  String makeSound();
}

abstract class Friendly {
  void beFriendly();
}

mixin Flyable {
  void fly() {
    print("I'm flying!");
  }
}

class Dog extends Pet implements Friendly {
  Dog({required String name}) : super(name);

  @override
  void beFriendly() {
    print("$name wags its tail.");
  }

  @override
  String makeSound() {
    return "Woof Woof!";
  }
}

class Cat extends Pet implements Friendly {
  Cat({required String name}) : super(name);

  @override
  void beFriendly() {
    print("$name purrs.");
  }

  @override
  String makeSound() {
    return "Meow!";
  }
}

class Bird extends Pet with Flyable {
  Bird({required String name}) : super(name);

  @override
  String makeSound() {
    return "Chirp Chirp!";
  }
}
