import 'package:flutter/material.dart';

class PersonModel extends ChangeNotifier {
  final List<Person> list = [];

  int get totalPerson => list.length;

  void addPerson(Person person) {
    list.add(person);
    notifyListeners();
  }
}

class Person {
  late final String name;
  late final String lastName;
  late final int age;

  Person(this.name, this.lastName, this.age);
}
