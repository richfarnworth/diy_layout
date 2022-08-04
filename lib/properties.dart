import 'package:flutter/material.dart';
import "property_dialog.dart";

class ListProperties extends StatefulWidget {
  const ListProperties({Key? key}) : super(key: key);

  @override
  State<ListProperties> createState() => _ListPropertiesState();
}

class _ListPropertiesState extends State<ListProperties> {
  int selectedProperty = 0;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                              const ListTile(
                                  title: Text('Properties'),
                              ),
                              propertyCard(context, 'Home', '14 Lesley Crescent'),
                              propertyCard(context, 'Beach house', '1 Yates Avenue'),
                          ],
        )
    );
  }
}

Card propertyCard(BuildContext context, String name, String address) {
  return Card(
    child: ListTile(
        leading: const Icon(Icons.house, size: 36),
        title: Text(name),
        subtitle: Text(address),
        trailing: IconButton(
          iconSize: 24,
          icon: const Icon(Icons.more_vert),
          onPressed: () => propertyDialog(context, name, address),
        ),
        onTap: () {
          Navigator.pop(context);
        }),
  );
}
