import 'package:flutter/material.dart';

class FilterOptions extends StatefulWidget {
  final Function(String) onFilterSelected;
  const FilterOptions({super.key, required this.onFilterSelected});

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
                  widget.onFilterSelected(label);
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
                    if (label != 'All') ...[
                      Icon(
                        icons[filters.indexOf(label) - 1],
                        size: 16,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                      const SizedBox(width: 5),
                    ],
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
