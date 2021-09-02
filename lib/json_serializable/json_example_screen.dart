import 'package:flutter/material.dart';

class JsonExampleScreen extends StatefulWidget {
  const JsonExampleScreen({Key? key}) : super(key: key);

  @override
  _JsonExampleScreenState createState() => _JsonExampleScreenState();
}

class _JsonExampleScreenState extends State<JsonExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
