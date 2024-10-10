// import 'package:flutter/material.dart';

// class SearchBarWidget extends StatelessWidget {
//   const SearchBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.search),
//         hintText: 'Please search here...',
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(85.0),
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarWidget({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (query) => onSearch(query), 
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
