import 'package:flutter/material.dart';
import 'package:flutter_examples/state_management/vanilla/models/person_model.dart';

class StateManagementScreen extends StatefulWidget {
  const StateManagementScreen({Key? key}) : super(key: key);

  @override
  _StateManagementScreenState createState() => _StateManagementScreenState();
}

class _StateManagementScreenState extends State<StateManagementScreen> {
  PersonModel _personModel = PersonModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: _personModel.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_personModel.list[index].name),
                    subtitle: Text(_personModel.list[index].lastName),
                    trailing: Text("${_personModel.list[index].age}"),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _personModel.addPerson(Person("Jane", "Doe", 25));
                  });
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
