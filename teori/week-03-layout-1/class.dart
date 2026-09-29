class animal {
  String name;
  int age;

  animal(this.name, this.age);

  void eat() {
    print("$name is eating");
  }

  void sleep() {
    print("$name is sleeping");
  }
}

void main() {
  animal cat = animal("Kitty", 2);
  cat.eat();
  cat.sleep();

  animal dog = animal("Buddy", 3);
  dog.eat();
  dog.sleep();
}