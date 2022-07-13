import 'package:flutter/material.dart';
import 'package:goode_notes/models/color_theme_data.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Text tealText = Text(
      'Teal',
      style: TextStyle(color: Colors.teal, fontSize: 15),
    );
    Text greenText = Text(
      'Green',
      style: TextStyle(color: Colors.green, fontSize: 15),
    );
    bool _value = Provider.of<ColorThemeData>(context).isTeal;
    return Card(
      child: SwitchListTile(
        subtitle: _value == false ? tealText : greenText,
        title: Text(
          'Change Theme Color',
          style: TextStyle(color: Colors.black),
        ),
        value: _value,
        onChanged: (bool value) {
          Provider.of<ColorThemeData>(context, listen: false)
              .switchTheme(value);
        },
      ),
    );
  }
}
