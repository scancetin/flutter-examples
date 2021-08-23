import 'package:flutter/material.dart';

class CollapseViewScreen extends StatefulWidget {
  const CollapseViewScreen({Key? key}) : super(key: key);

  @override
  _CollapseViewScreenState createState() => _CollapseViewScreenState();
}

class _CollapseViewScreenState extends State<CollapseViewScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            color: Colors.yellow,
            child: ExpansionTile(
              title: Text("Counter"),
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text("$index"),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
