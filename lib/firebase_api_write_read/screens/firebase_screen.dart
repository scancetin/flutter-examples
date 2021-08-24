import 'dart:convert';
import 'package:flutter_examples/firebase_api_write_read/models/album_model.dart';
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
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: getDataWidget(),
          ),
          Expanded(
            flex: 1,
            child: postDataWidget(context),
          ),
        ],
      ),
    );
  }

  Center getDataWidget() {
    return Center(
      child: FutureBuilder<List<AlbumModel>>(
        future: getJsonDatas(),
        builder: (BuildContext context, AsyncSnapshot<List<AlbumModel>> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text("${snapshot.data![index].userId}"),
                title: Text(snapshot.data![index].title),
                trailing: Text("${snapshot.data![index].id}"),
              );
            },
          );
        },
      ),
    );
  }

  Center postDataWidget(BuildContext context) {
    return Center(
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
    );
  }

  Future<bool> postJsonDatas() async {
    final String _url = "https://fir-sample-api-5f7ac-default-rtdb.europe-west1.firebasedatabase.app/.json";
    final _album = AlbumModel(id: int.parse(_idController.text), title: _titleController.text, userId: int.parse(_userIdController.text));
    final _response = await http.post(Uri.parse(_url), body: json.encode(_album.toJson()));

    if (_response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<AlbumModel>> getJsonDatas() async {
    final String url = "https://fir-sample-api-5f7ac-default-rtdb.europe-west1.firebasedatabase.app/.json";
    final response = await http.get(Uri.parse(url));
    Iterable albums = json.decode(response.body);
    List<AlbumModel> posts = List<AlbumModel>.from(albums.map((model) => AlbumModel.fromJson(model)));

    print(posts.length);
    return posts;
  }
}
