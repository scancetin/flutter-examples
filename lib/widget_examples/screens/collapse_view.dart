import 'package:flutter/material.dart';

class CollapseViewPage extends StatefulWidget {
  const CollapseViewPage({Key? key}) : super(key: key);

  @override
  _CollapseViewPageState createState() => _CollapseViewPageState();
}

class _CollapseViewPageState extends State<CollapseViewPage> {
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
