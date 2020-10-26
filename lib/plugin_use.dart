import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';

class PluginUse extends StatefulWidget {
  @override
  _PluginUseState createState() => _PluginUseState();
}

class _PluginUseState extends State<PluginUse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "plugin study",
      theme: ThemeData(primarySwatch: Colors.lime),
      home: Scaffold(
        appBar: AppBar(
          title: Text("How to use Plugin"),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
        ),
        body: Container(
          decoration: BoxDecoration(
            color: ColorUtil.color("#e8e8e8"),
          ),
          child: Column(
            children: [
              ClipOval(
                child: Text("desk"),
              )
            ],
          ),
        )
      )
    );
  }
}
