import 'package:flutter/material.dart';

final MyPersonNotify personNotify = MyPersonNotify(PersonModel());

class MyPersonNotify extends ValueNotifier<PersonModel> {
  MyPersonNotify(PersonModel value) : super(value);

  void addPerson(Person person) {
    value.list.add(person);
    notifyListeners();
  }

  void printPersons() {
    for (var person in value.list) {
      print("${person.personIndex}  ${person.name}  ${person.lastName}  ${person.age}");
    }
  }

  int get newPersonIndex => value.totalPerson;
}

class PersonModel {
  final List<Person> list = [];

  int get totalPerson => list.length;
}

class Person {
  late final int personIndex;
  late final String name;
  late final String lastName;
  late final int age;

  Person(this.personIndex, this.name, this.lastName, this.age);
}
