import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownSearchWidget extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final List<String> items;
  final Function(String) onChanged;

  const DropDownSearchWidget({
    super.key,
    required this.icon,
    required this.hintText,
    required this.items,
    required this.onChanged,
  });

  @override
  State<DropDownSearchWidget> createState() => _DropDownSearchWidgetState();
}

class _DropDownSearchWidgetState extends State<DropDownSearchWidget> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 22,
            child: Icon(widget.icon, size: 24, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                DropdownSearch<String>(
                  items: widget.items,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedItem = newValue;
                    });
                    if (newValue != null) {
                      widget.onChanged(newValue);
                    }
                  },
                  selectedItem: _selectedItem, 
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Visibility(
                  visible: _selectedItem != null,
                  child: Text(widget.hintText,
                      style: TextStyle(color: Colors.grey)),
                ),
                const Divider(thickness: 1.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
