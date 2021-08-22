import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedExampleScreen extends StatefulWidget {
  SharedExampleScreen({Key? key}) : super(key: key);

  @override
  _SharedExampleScreenState createState() => _SharedExampleScreenState();
}

class _SharedExampleScreenState extends State<SharedExampleScreen> {
  int _id = 0;
  String _name = "";
  String _lastName = "";
  int _age = 0;

  @override
  void initState() {
    super.initState();
  }

  Future saveData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt("id", 1);
    _prefs.setString("name", "Jane");
    _prefs.setString("lastName", "Jane");
    _prefs.setInt("age", 24);
    print(_id);
    print(_name);
    print(_lastName);
    print(_age);
  }

  Future getData() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _id = _prefs.getInt("id")!;
    _name = _prefs.getString("name")!;
    _lastName = _prefs.getString("lastName")!;
    _age = _prefs.getInt("age")!;
    print(_id);
    print(_name);
    print(_lastName);
    print(_age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.upload, size: 60),
              label: Text("Get Data", style: TextStyle(fontSize: 24)),
              onPressed: () {
                setState(() {
                  getData();
                });
              },
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.blue,
              child: ListTile(
                leading: Text("$_id"),
                title: Text("$_name"),
                subtitle: Text("$_lastName"),
                trailing: Text("$_age"),
              ),
            ),
            TextButton.icon(
              icon: Icon(Icons.download, size: 60),
              label: Text("Save Data", style: TextStyle(fontSize: 24)),
              onPressed: () {
                saveData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
