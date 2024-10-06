import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  const FilterOptions({Key? key}) : super(key: key);

  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  final List<String> filters = [
    'All',
    'Location',
    'Medical',
    'Hotel',
    'Restaurant',
  ];

  final List<IconData> icons = [
    Icons.all_inclusive,
    Icons.location_on,
    Icons.local_hospital,
    Icons.hotel,
    Icons.restaurant,
  ];

  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((label) {
          bool isSelected = label == selectedFilter;

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = label;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue[100] : Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[filters.indexOf(label)],
                      size: 16,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
