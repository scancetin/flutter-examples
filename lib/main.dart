import 'package:flutter/material.dart';
import 'package:flutter_examples/custom_theme/model/custom_theme_model.dart';
import 'package:flutter_examples/file_manager/file_download_screen.dart';
import 'package:flutter_examples/firebase_api_write_read/screens/firebase_screen.dart';
import 'package:flutter_examples/shared_preferences/shared_example.dart';
import 'package:flutter_examples/state_management/provider/models/person_model.dart';
import 'package:flutter_examples/state_management/provider/provider_screen.dart';
import 'package:flutter_examples/state_management/value_notifier/value_notifier_screen.dart';
import 'package:flutter_examples/state_management/vanilla/state_screen.dart';
import 'package:flutter_examples/widget_examples/collapse_view.dart';
import 'package:flutter_examples/widget_examples/page_view_screen.dart';
import 'package:flutter_examples/widget_examples/popup_example_widget.dart';
import 'package:provider/provider.dart';
import 'custom_theme/change_theme_screen.dart';
import 'custom_theme/custom_theme.dart';
import 'json_serializable/json_example_screen.dart';
import 'using_http_futurebuilder/screens/using_futurebuilder.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PersonModel()),
          ChangeNotifierProvider(create: (context) => CustomThemeModel()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<CustomThemeModel>(context).getThemeData,
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: JsonExampleScreen(),
    );
  }
}
