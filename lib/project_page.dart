import 'package:flutter/material.dart';

import 'checklist.dart';

var steps = [
  "This is a test",
  "Second step",
  "third step"
];


class ProjectPage extends StatefulWidget {
  // This widget is the root of your application.
  @override //For stateful widget override createState.
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
            const Image(
                  image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/6/6a/FiberGutter_brand_Fiberglass_Gutter.jpg'),
                ),
            Column(children: const [
                  MyStatefulWidget(expansionBodies: [])
                ])
          ]);
  }
}

// stores ExpansionPanel state information
class Item {
  Item({required this.expandedValue, required this.headerValue, required this.bodyWidget, this.isExpanded = false});

  String expandedValue;
  String headerValue;
  bool isExpanded;
  Widget bodyWidget;
}

List<Item> generateItems(int numberOfItems) {
  /*return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });*/
  var items = [
    Item(headerValue: 'Tools', expandedValue: 'List of tools', bodyWidget: Column(children: drawSteps(steps))),
    Item(
        headerValue: 'Materials',
        expandedValue: 'Materials list',
        bodyWidget: const ListTile(
          title: Text("test"),
          subtitle: Text('To delete this panel, tap the trash can icon'),
        )),
    Item(headerValue: 'Steps', expandedValue: 'Steps', bodyWidget: Column(children: drawSteps(steps)))
  ];
  return items;
}

class MyStatefulWidget extends StatefulWidget {
  final List<Widget> expansionBodies;
  const MyStatefulWidget({Key? key, required this.expansionBodies}) : super(key: key);
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: item.bodyWidget //Column(children: drawSteps(steps))
          /*ListTile(
            title: Text(item.expandedValue),
            subtitle: const Text('To delete this panel, tap the trash can icon'),
          )*/
          ,
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
