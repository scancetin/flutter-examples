import 'package:flutter/material.dart';
import 'package:flutter_examples/state_management/provider/models/person_model.dart';
import 'package:provider/provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Consumer<PersonModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    itemCount: model.totalPerson,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(model.list[index].name),
                        subtitle: Text(model.list[index].lastName),
                        trailing: Text("${model.list[index].age}"),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Provider.of<PersonModel>(context, listen: false).addPerson(Person("Jane", "Doe", 25));
                },
                icon: Icon(Icons.add, size: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
