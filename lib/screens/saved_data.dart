import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class SavedData extends StatelessWidget {
  List<String>? savedData;

  SavedData({super.key, this.savedData});

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    savedData = prefs.getStringList('items');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Data'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: savedData != null ? savedData!.length : 0,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(savedData![index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
