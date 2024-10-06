import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Please search here...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(85.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
      ),
    );
  }
}
