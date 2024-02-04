// import 'package:iSikhi/Counter.txt';
import 'package:iSikhi/CounterPage.dart';
import 'package:iSikhi/ListView.dart';
import 'package:iSikhi/PodcastScreen.dart';
import 'package:flutter/material.dart';
import 'package:iSikhi/CounterPage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    join(await getDatabasesPath(), 'rhymes_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE rhymes(id INTEGER PRIMARY KEY, name TEXT, count INTEGER)",
      );
    },
    version: 1,
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Database database;

  MyApp({required this.database});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IkOnkaar - God Is One',
      home: RhymesScreen(database: database),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RhymesScreen extends StatefulWidget {
  final Database database;

  RhymesScreen({required this.database});

  @override
  _RhymesScreenState createState() => _RhymesScreenState();
}

class _RhymesScreenState extends State<RhymesScreen> {
  List<Map<String, dynamic>> rhymes = [];
  @override
  void initState() {
    super.initState();
    refreshRhymes();
  }

  Future<void> refreshRhymes() async {
    final List<Map<String, dynamic>> refreshedRhymes =
        await widget.database.query('rhymes');
    setState(() {
      rhymes = refreshedRhymes;
    });
  }

  Future<void> addRhyme(String name) async {
    await widget.database.insert(
      'rhymes',
      {'name': name, 'count': 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    refreshRhymes();
  }

  Future<void> editRhyme(int rhymeId, String newName) async {
    await widget.database.update(
      'rhymes',
      {'name': newName},
      where: 'id = ?',
      whereArgs: [rhymeId],
    );
    refreshRhymes();
  }

  Future<void> deleteRhyme(int rhymeId) async {
    await widget.database.delete(
      'rhymes',
      where: 'id = ?',
      whereArgs: [rhymeId],
    );
    refreshRhymes();
  }

  void navigateToRhymeDetail(
      int rhymeId, String rhymeName, BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CounterPageScreen(
            rhymeId: rhymeId, rhymeName: rhymeName, database: widget.database),
      ),
    );
    // Refresh the data when returning from RhymeDetailScreen
    refreshRhymes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IkOnkaar - God Is One',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF303030),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Open the custom shape menu when the menu icon is tapped
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
              ),
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // ListTile(
                      //   title: Text('Counter'),
                      //   onTap: () {
                      //     // Handle item 1 tap
                      //     print('Item 1 tapped');
                      //     Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => RhymesScreen(),

                      //     ),
                      //   );
                      //   },
                      // ),
                      ListTile(
                        title: Text('Read Gurbaani'),
                        onTap: () {
                          // Handle item 2 tap
                          print('Item 2 tapped');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyListViewPage(),
                            ),
                          ); // Close the menu
                        },
                      ),
                      ListTile(
                        title: Text('Listen Gurbaani'),
                        onTap: () {
                          // Handle item 2 tap
                          print('Item 2 tapped');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastScreen(),
                            ),
                          ); // Close the menu
                        },
                      ),
                      // Add more ListTiles for additional menu items
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background image (visible when the list is not empty)
          if (rhymes.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/khanda.png'), // Replace with your image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
          // Rhymes list
          if (rhymes.isNotEmpty)
            ListView.builder(
              itemCount: rhymes.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Color(0xFF303030), // Set background color here
                  child: ListTile(
                    title: Text(
                      rhymes[index]['name'],
                      style: TextStyle(color: Colors.white), // Set text color
                    ),
                    subtitle: Text(
                      'Count: ${rhymes[index]['count']}',
                      style: TextStyle(color: Colors.white), // Set text color
                    ),
                    onTap: () {
                      navigateToRhymeDetail(
                          rhymes[index]['id'], rhymes[index]['name'], context);
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit,
                              color: Colors.white), // Set icon color to white
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                String newName = rhymes[index]['name'];
                                return AlertDialog(
                                  title: Text('Edit Path'),
                                  content: Column(
                                    children: [
                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: 'New Path Name',
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                        ),
                                        onChanged: (value) {
                                          newName = value;
                                        },
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Edit rhyme in the database
                                        editRhyme(rhymes[index]['id'], newName);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Save',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete,
                              color: Colors.white), // Set icon color to white
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Path'),
                                  content: Text(
                                      'Are you sure you want to delete this rhyme?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Delete rhyme from the database
                                        deleteRhyme(rhymes[index]['id']);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Delete',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          // Centered image (visible when the list is empty)
          if (rhymes.isEmpty)
            Image.asset(
              'assets/khanda.png', // Replace with your image asset
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String rhymeName = '';
              return AlertDialog(
                title: Text('Add New Path'),
                content: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Path Name'),
                      onChanged: (value) {
                        rhymeName = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.black)),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add rhyme to the database
                      addRhyme(rhymeName);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add', style: TextStyle(color: Colors.black)),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF303030),
      ),
    );
  }
}
