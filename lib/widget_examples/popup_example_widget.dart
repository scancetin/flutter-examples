import 'package:flutter/material.dart';

class PopupExampleWidget extends StatefulWidget {
  const PopupExampleWidget({Key? key}) : super(key: key);

  @override
  _PopupExampleWidgetState createState() => _PopupExampleWidgetState();
}

enum ColorEnum {
  yellow,
  blue,
  red,
  green,
}

List _colorList = [
  Colors.yellow,
  Colors.blue,
  Colors.red,
  Colors.green,
];

Color _chosenColor = Colors.white;

class _PopupExampleWidgetState extends State<PopupExampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: _chosenColor,
        child: PopupMenuButton<ColorEnum>(
          icon: Icon(Icons.color_lens, size: 50),
          onSelected: (color) {
            print("Chosen Color Is : $color");
            setState(() {
              _chosenColor = _colorList[color.index];
            });
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text("Yellow"),
              value: ColorEnum.yellow,
            ),
            PopupMenuItem(
              child: Text("Blue"),
              value: ColorEnum.blue,
            ),
            PopupMenuItem(
              child: Text("Red"),
              value: ColorEnum.red,
            ),
            PopupMenuItem(
              child: Text("Green"),
              value: ColorEnum.green,
            ),
          ],
        ),
      ),
    );
  }
}
