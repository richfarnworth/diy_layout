import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String fieldName;
  final String initialValue;
  const FormTextField(this.fieldName,this.initialValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextFormField(
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: fieldName,
          ),
          initialValue: initialValue,
        ));
  }
}

class DropDownMenu extends StatefulWidget {
  final String fieldName;
  final List<String> options;

  const DropDownMenu({Key? key, this.fieldName = "", this.options = const []}) : super(key: key);
  @override
  State<DropDownMenu> createState() => DropDownMenuState(options);
}

class DropDownMenuState extends State<DropDownMenu> {
  List<String> options = const [];
  String dropdownValue = "";
  DropDownMenuState(this.options) {
    dropdownValue = options[0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(widget.fieldName),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: TextStyle(color: Theme.of(context).hoverColor),
            underline: Container(
              height: 2,
              color: Theme.of(context).hoverColor,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
        ]));
  }
}
