import 'package:flutter/material.dart';
import 'package:flutter_examples/state_management/value_notifier/models/person_model.dart';

class ValueNotifierScreen extends StatefulWidget {
  const ValueNotifierScreen({Key? key}) : super(key: key);

  @override
  _ValueNotifierScreenState createState() => _ValueNotifierScreenState();
}

class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ValueListenableBuilder(
                valueListenable: personNotify,
                builder: (context, PersonModel personModel, child) {
                  return ListView.builder(
                    itemCount: personModel.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Text("${personModel.list[index].personIndex}"),
                        title: Text(personModel.list[index].name),
                        subtitle: Text(personModel.list[index].lastName),
                        trailing: Text("${personModel.list[index].age}"),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                onPressed: () {
                  personNotify.addPerson(Person(personNotify.newPersonIndex, "Jane", "Doe", 25));
                  personNotify.printPersons();
                },
                icon: Icon(Icons.add, size: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
