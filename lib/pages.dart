import 'package:flutter/material.dart';

var pageTitles = [
  "Test",
  "This",
  "Feature"
];

class SwitchPage extends StatelessWidget {
  const SwitchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text('This');
  }
}

class SwitchPage2 extends StatelessWidget {
  const SwitchPage2({Key? key}) : super(key: key);
  final String pageTitle = "Title 2";
  @override
  Widget build(BuildContext context) {
    return const Text('Again');
  }
}

class SwitchPage3 extends StatelessWidget {
  Function buttonCallback = () => {};
  final String pageTitle = "Title 3";

  SwitchPage3(Function btnCallback) : super() {
    buttonCallback = btnCallback;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.red;
          return null; // Defer to the widget's default.
        }),
      ),
      onPressed: () {
        buttonCallback(0);
      },
      child: const Text('TextButton'),
    );
  }
}
