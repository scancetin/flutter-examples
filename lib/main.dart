import 'package:flutter/material.dart';
import 'package:flutter_examples/firebase_api_write/screens/firebase_screen.dart';
import 'package:flutter_examples/page_view_example/screens/page_view_screen.dart';
import 'using_http_futurebuilder/screens/using_futurebuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: PageViewScreen(),
    );
  }
}
