import 'package:flutter/material.dart';

import 'using_http_futurebuilder/screens/using_futurebuilder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: JsonExamplePage(),
    );
  }
}
