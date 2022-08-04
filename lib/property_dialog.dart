import 'package:flutter/material.dart';

void propertyDialog(BuildContext context, String name, String address) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(name),
      content: ListView(children: [
        Text(address),
        const ListTile(title: Text('EDIT')),
        const ListTile(
          title: Text('DELETE'),
          textColor: Colors.red,
        )
      ]),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('back'),
        ),
      ],
    ),
  );
}
