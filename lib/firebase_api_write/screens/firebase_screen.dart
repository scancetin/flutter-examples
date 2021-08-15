import 'dart:convert';
import 'package:flutter_examples/firebase_api_write/models/album_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FirebaseExampleScreen extends StatefulWidget {
  FirebaseExampleScreen({Key? key}) : super(key: key);

  @override
  _FirebaseExampleScreenState createState() => _FirebaseExampleScreenState();
}

class _FirebaseExampleScreenState extends State<FirebaseExampleScreen> {
  late TextEditingController _userIdController;
  late TextEditingController _idController;
  late TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    _userIdController = TextEditingController();
    _idController = TextEditingController();
    _titleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.add, color: Colors.blueAccent),
          iconSize: 200,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _userIdController,
                        decoration: InputDecoration(labelText: "User Id"),
                      ),
                      TextField(
                        controller: _idController,
                        decoration: InputDecoration(labelText: "Id"),
                      ),
                      TextField(
                        controller: _titleController,
                        decoration: InputDecoration(labelText: "Title"),
                      ),
                      IconButton(
                        onPressed: () async {
                          final _result = await postJsonDatas();
                          print(_result);
                        },
                        icon: Icon(Icons.add),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> postJsonDatas() async {
    final _album = AlbumModel(id: int.parse(_idController.text), title: _titleController.text, userId: int.parse(_userIdController.text));

    final _response = await http.post(Uri.parse("https://fir-sample-api-5f7ac-default-rtdb.europe-west1.firebasedatabase.app/.json"), body: json.encode(_album.toJson()));

    if (_response.statusCode == 200) {
      return true;
    } else {
      print(_response.body);
      return false;
    }
  }
}
