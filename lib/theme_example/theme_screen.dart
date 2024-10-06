import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/theme_example/theme_provider.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme,
             title: Text("Light Mode"),
          ),
          RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme,
            title: const Text("Dark Mode"),
          ),
          RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: themeProvider.setTheme,
            title: const Text("System  Mode"),
          ),

        ],
      ),
    );
  }
}
