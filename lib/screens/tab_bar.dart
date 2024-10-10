import 'package:flutter/material.dart';
import 'package:navbar_pages/screens/lab_science.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: const [
              Tab(icon: Icon(Icons.house_siding_sharp)),
              Tab(icon: Icon(Icons.hourglass_bottom)),
              Tab(icon: Icon(Icons.dangerous)),
            ]),
            title: const Text('Tab Items'),
          ),
          body: TabBarView(children: const [
            Center(child: LabScience()),
            Center(child: Text('This page is under development')),
            Center(child: Text('This page is not ready yet')),
          ])),
    );
  }
}
