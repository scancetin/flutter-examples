import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_examples/alert_dialog/models/album_model.dart';

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
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          postDataButtonWidget(context),
        ],
      ),
    );
  }

  Expanded postDataButtonWidget(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Center(
        child: IconButton(
          icon: Icon(Icons.add, color: Colors.blueAccent),
          iconSize: 150,
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

  // Future<AlbumModel> getJsonDatas() async {
  //   final _response = await http.get(Uri.parse("https://fir-sample-api-5f7ac-default-rtdb.europe-west1.firebasedatabase.app/.json"));
  //   var album = AlbumModel.fromJson(json.decode(_response.body));
  //   print(album.id);
  //   print(album.userId);
  //   print(album.title);
  //   return album;
  // }

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
