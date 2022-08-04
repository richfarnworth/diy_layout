import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

List<Widget> drawSteps(steps_list) {
  return steps_list.map<Widget>((step) => displayStep(step)).toList();
}

Widget displayStep(String description) {
  return checkboxTileClass(checkItemText: description);
}

class checkboxTileClass extends StatefulWidget {
  String checkItemText;
  checkboxTileClass({Key? key, required this.checkItemText}) : super(key: key);

  @override
  State<checkboxTileClass> createState() => _checkboxTileClassState();
}

class _checkboxTileClassState extends State<checkboxTileClass> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.checkItemText),
      value: timeDilation != 1.0,
      onChanged: (bool? value) {
        setState(() {
          timeDilation = value! ? 2.0 : 1.0;
        });
      },
      secondary: const Icon(Icons.hourglass_empty),
    );
  }
}