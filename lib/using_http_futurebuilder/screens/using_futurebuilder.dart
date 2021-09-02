import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_examples/using_http_futurebuilder/models/post_model.dart';
import 'package:http/http.dart' as http;

class JsonFutureBuilderScreen extends StatefulWidget {
  JsonFutureBuilderScreen({Key? key}) : super(key: key);

  @override
  _JsonFutureBuilderScreenState createState() => _JsonFutureBuilderScreenState();
}

class _JsonFutureBuilderScreenState extends State<JsonFutureBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<PostModel>(
          future: getJsonDatas(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListTile(
              leading: Text("${snapshot.data.completed}"),
              title: Text(snapshot.data.title),
              subtitle: Text("${snapshot.data.userId}"),
              trailing: Text("${snapshot.data.id}"),
            );
          },
        ),
      ),
    );
  }

  Future<PostModel> getJsonDatas() async {
    final _response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    var post = PostModel.fromJson(json.decode(_response.body));
    return post;
  }
}
