import 'package:flutter/material.dart';
import 'package:flutter_examples/file_manager/file_download_screen.dart';
import 'package:flutter_examples/firebase_api_write/screens/firebase_screen.dart';
import 'package:flutter_examples/shared_preferences/shared_example.dart';
import 'package:flutter_examples/widget_examples/collapse_view.dart';
import 'package:flutter_examples/widget_examples/page_view_screen.dart';
import 'using_http_futurebuilder/screens/using_futurebuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: SharedExampleScreen(),
    );
  }
}
