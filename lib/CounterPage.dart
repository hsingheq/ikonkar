// import 'package:iSikhi/Counter.txt';
import 'package:iSikhi/ListView.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:keep_screen_on/keep_screen_on.dart';

class CounterPageScreen extends StatefulWidget {
  final int rhymeId;
  final String rhymeName;
  final Database database;

  CounterPageScreen(
      {required this.rhymeId, required this.rhymeName, required this.database});

  @override
  _CounterPageScreenState createState() => _CounterPageScreenState();
}

class _CounterPageScreenState extends State<CounterPageScreen> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    // Keep the screen on.
    KeepScreenOn.turnOn();
    fetchRhymeDetails();
  }

  Future<void> fetchRhymeDetails() async {
    final List<Map<String, dynamic>> rhymeDetails = await widget.database.query(
      'rhymes',
      where: 'id = ?',
      whereArgs: [widget.rhymeId],
    );

    setState(() {
      count = rhymeDetails[0]['count'];
    });
  }

  Future<void> updateCount(int newCount) async {
    await widget.database.rawUpdate(
      'UPDATE rhymes SET count = ? WHERE id = ?',
      [newCount, widget.rhymeId],
    );
    fetchRhymeDetails();
  }

  Future<void> incrementCount() async {
    await updateCount(count + 1);
  }

  Future<void> decrementCount() async {
    await updateCount(count - 1);
  }

  Future<void> resetToCount(int specificCount) async {
    await updateCount(specificCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rhymeName),
        backgroundColor: Color(0xFF303030),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Rhyme ID: ${widget.rhymeId}'),
            SizedBox(height: 20),
            Text('Count: ', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              '$count',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 180,
                  backgroundColor: Colors.green[400],
                  child: IconButton(
                    iconSize: 340,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      incrementCount();
                    },
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     incrementCount();
            //   },
            //   child: Text('Increment Count'),
            // ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green[400],
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      decrementCount();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color(0xFF303030), // Set the background color here
                // You can customize other button properties as well
                padding: EdgeInsets.all(16.0),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String resetCount = '';

                    return AlertDialog(
                      title: Text('Reset Count',
                          style: TextStyle(color: Colors.white)),
                      content: Column(
                        children: [
                          TextField(
                            decoration:
                                InputDecoration(labelText: 'Enter Count'),
                            onChanged: (value) {
                              resetCount = value;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.black)),
                        ),
                        TextButton(
                          onPressed: () {
                            // Reset count to a specific value
                            resetToCount(int.parse(resetCount));
                            Navigator.of(context).pop();
                          },
                          child: Text('Reset',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Reset Count', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
