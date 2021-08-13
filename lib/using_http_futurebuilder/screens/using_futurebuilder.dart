import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_examples/using_http_futurebuilder/models/post_modal.dart';
import 'package:http/http.dart' as http;

class JsonExamplePage extends StatefulWidget {
  JsonExamplePage({Key? key}) : super(key: key);

  @override
  _JsonExamplePageState createState() => _JsonExamplePageState();
}

class _JsonExamplePageState extends State<JsonExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<PostModal>(
          future: getJsonDatas(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListTile(
              title: Text(snapshot.data.title),
              subtitle: Text("${snapshot.data.completed}"),
            );
          },
        ),
      ),
    );
  }

  Future<PostModal> getJsonDatas() async {
    final _response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
    var post = PostModal.fromJson(json.decode(_response.body));
    return post;
  }
}
