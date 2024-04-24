import 'package:flutter/material.dart';

class SettingsPageScreen extends StatefulWidget {
  @override
  State<SettingsPageScreen> createState() => _SettingsPageScreenState();
}

class _SettingsPageScreenState extends State<SettingsPageScreen> {
  ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'Настройки',
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          softWrap: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushNamed('/course');
          },
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/log-in');
            },
            height: 50,
            // margin: EdgeInsets.symmetric(horizontal: 50),
            color: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            // decoration: BoxDecoration(
            // ),
            child: Center(
              child: Text(
                "Выйти",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
