import 'package:flutter/material.dart';
import "common_widgets.dart";

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import "schema.dart";

class PropertyPage extends StatelessWidget {
  String pageTitle = "Edit Property";
  PropertyPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Property>(
        future:setupDB(),
        builder: (BuildContext context, AsyncSnapshot<Property> snapshot) {
          if (snapshot.hasData) {
            return Column(children: [
              FormTextField('Property Name',
                  snapshot.data!.propertyName),
              FormTextField('Address', snapshot.data!.propertyAddress),
              DropDownMenu(fieldName: 'Property type', options: [
                'House',
                'Apartment',
                'test'
              ]),
              DropDownMenu(fieldName: '# Bedrooms', options: [
                'studio',
                '1',
                '2',
                '3',
                '4',
                '5+'
              ]),
            ]);

            //return Text(snapshot.data ?? "");
          }
          else {
            return Text('not found');
          }
        }
    );
  }
}



Future<Database> getDatabase(dbName,createText) async{
  return openDatabase(
      join(await getDatabasesPath(), dbName),
  onCreate: (db, version) {
  return db.execute(createText,);
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
  );
}

Future<Property> setupDB() async{
  WidgetsFlutterBinding.ensureInitialized();
// Open the database and store the reference.
  final database = getDatabase('propertyDatabase.db',  'CREATE TABLE properties(propertyName TEXT PRIMARY KEY, propertyAddress TEXT)');


  // Define a function that inserts dogs into the database
  Future<void> insertProperty(Property property) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'properties',
      property.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


// A method that retrieves all the dogs from the dogs table.
  Future<List<Property>> properties() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('properties');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Property(
          propertyName: maps[i]['propertyName'],
          propertyAddress: maps[i]['propertyAddress']
      );
    });
  }

  // Create a Dog and add it to the dogs table
  var fido = Property(
    propertyName: 'crafers',
    propertyAddress: '14 Lesley Crescent',
  );

  await insertProperty(fido);

  List<Property> ld = await properties(); // Prints a list that include Fido.
  return ld[0];

}


enum PropertyType { house, apartment }

class Property extends HandyObject {
  String propertyName;
  String propertyAddress;
  /*UserAccount userAccount;
  PropertyType propertyType;*/
  /*List<Project> projects = [];*/
  Property({required this.propertyName, required this.propertyAddress, /*required this.propertyType, required this.userAccount*/}) : super();

  /*void addProject(String projectName) {
    projects.add(Project(projectName: projectName, property: this));
  }*/

  Map<String, dynamic> toMap() {
    return {
      'propertyName': propertyName,
      'propertyAddress': propertyAddress,
    };
  }
}