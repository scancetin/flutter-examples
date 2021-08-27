import 'package:flutter/material.dart';
import 'package:flutter_examples/custom_theme/model/custom_theme_model.dart';
import 'package:provider/provider.dart';

import 'custom_theme.dart';

class ChangeThemeScreen extends StatelessWidget {
  const ChangeThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Provider.of<CustomThemeModel>(context, listen: false).setThemeData(ThemeData.dark());
                  },
                  icon: Icon(Icons.dark_mode, size: 50),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<CustomThemeModel>(context, listen: false).setThemeData(ThemeData.light());
                  },
                  icon: Icon(Icons.light_mode, size: 50),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Provider.of<CustomThemeModel>(context, listen: false).setThemeData(sampleThemeData);
              },
              child: Text("Custom Theme 1"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<CustomThemeModel>(context, listen: false).setThemeData(myTheme);
              },
              child: Text("Custom Theme 2"),
            ),
          ],
        ),
      ),
    );
  }
}
