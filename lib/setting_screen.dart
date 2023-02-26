import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_design/chat_screen.dart';
import 'package:whatsapp_design/home_screen.dart';
import 'package:whatsapp_design/theme_changer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          },
        ),
        title: const Text('Zain Asif'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: AnimatedCrossFade(
              crossFadeState: Theme.of(context).brightness == Brightness.light
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: const CircleAvatar(
                  radius: 50, backgroundImage: AssetImage("images/jutt.jpg")),
              secondChild: const CircleAvatar(
                  radius: 50, backgroundImage: AssetImage("images/jutt.jpg")),
              duration: const Duration(milliseconds: 200),
            ),
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.light,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.dark,
            onChanged: themeChanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            groupValue: themeChanger.themeMode,
            value: ThemeMode.system,
            onChanged: themeChanger.setTheme,
          ),
        ],
      ),
    );
  }
}
