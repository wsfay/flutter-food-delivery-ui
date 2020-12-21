import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Settings',
        ),
      ),
      body: Center(
        child: Text('Settings',style: Theme.of(context).textTheme.bodyText1,),
      ),
    );
  }
}
