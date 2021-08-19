import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Expanded(
            flex: 4,
            child: pageViewWidget(),
          ),
          Spacer(),
        ],
      ),
    );
  }

  PageView pageViewWidget() {
    final PageController _controller = PageController(initialPage: 0);
    return PageView(
      controller: _controller,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text("first"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text("second"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text("third"),
          ),
        ),
      ],
    );
  }
}
