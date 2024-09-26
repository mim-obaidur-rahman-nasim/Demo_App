import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DropDownSearch());
}

class DropDownSearch extends StatelessWidget {
  const DropDownSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SearchableDropdown(),
    );
  }
}

class SearchableDropdown extends StatefulWidget {
  const SearchableDropdown({super.key});

  @override
  _SearchableDropdownScreenState createState() =>
      _SearchableDropdownScreenState();
}

class _SearchableDropdownScreenState extends State<SearchableDropdown> {
  String? selectedItem;

  final List<String> items = [
    'C',
    'C++',
    'Java',
    'Python',
    'JavaScript',
    'React',
    'Flutter',
    'Swift',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownSearch<String>(
                items: items,
                onChanged: (String? value) {
                  setState(() {
                    selectedItem = value;
                  });
                },
                selectedItem: selectedItem ?? 'Select a Language',
                popupProps: const PopupProps.menu(
                  showSearchBox: true,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
