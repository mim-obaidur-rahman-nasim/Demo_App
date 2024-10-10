// import 'package:flutter/material.dart';
// import 'package:navbar_pages/widgets/discount_cards_widget.dart';
// import 'package:navbar_pages/widgets/filter_widget.dart';
// import 'package:navbar_pages/widgets/search_widget.dart';

// class DiscountClub extends StatefulWidget {
//   const DiscountClub({super.key});

//   @override
//   State<DiscountClub> createState() => _DiscountClubState();
// }

// class _DiscountClubState extends State<DiscountClub> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Discount Club'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: const [
//               FilterOptions(),
//               SizedBox(height: 10),
//               SearchBarWidget(),
//               SizedBox(height: 10),
//               DiscountCards()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:navbar_pages/widgets/discount_cards_widget.dart';
import 'package:navbar_pages/widgets/filter_widget.dart';
import 'package:navbar_pages/widgets/search_widget.dart';

class DiscountClub extends StatefulWidget {
  const DiscountClub({super.key});

  @override
  State<DiscountClub> createState() => _DiscountClubState();
}

class _DiscountClubState extends State<DiscountClub> {
  List<Map<String, String>> allCards = [
    {
      'imagePath': 'assets/img/lab-science-logo.png',
      'title': 'Lab Science Diagnostics Center',
      'category': 'Medical',
      'location': '1205-Newmarket, Dhaka'
    },
    {
      'imagePath': 'assets/img/care-box.png',
      'title': 'Care-Box Limited',
      'category': 'Medical',
      'location': '1215-Tejgaon, Dhaka'
    },
    {
      'imagePath': 'assets/img/rainy-roof.png',
      'title': 'Rainy Roof Restaurant',
      'category': 'Restaurant',
      'location': '1215-Tejgaon, Dhaka'
    },
    {
      'imagePath': 'assets/img/logo.png',
      'title': 'Parjatan Motel Rajshahi',
      'category': 'Hotel',
      'location': '6000-Rajpara, Rajshahi'
    },
    {
      'imagePath': 'assets/img/puro-logo-2.png',
      'title': 'Puro Foods Limited',
      'category': 'Restaurant',
      'location': 'Anywhere in Bangladesh'
    },
    {
      'imagePath': 'assets/img/praava-logo.png',
      'title': 'Praava Health',
      'category': 'Medical',
      'location': '1212-Gulshan, Dhaka'
    },
  ];

  List<Map<String, String>> filteredCards = [];
  String selectedFilter = 'All';

  @override
  void initState() {
    super.initState();
    filteredCards = allCards;
  }

  void filterCards(String query) {
    setState(() {
      filteredCards = allCards
          .where((card) =>
              card['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void updateFilter(String filter) {
    setState(() {
      selectedFilter = filter;
      if (filter == 'All') {
        filteredCards = allCards;
      } else {
        filteredCards =
            allCards.where((card) => card['category'] == filter).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Club'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FilterOptions(onFilterSelected: updateFilter),
              const SizedBox(height: 10),
              SearchBarWidget(onSearch: filterCards),
              const SizedBox(height: 10),
              DiscountCards(cards: filteredCards),
            ],
          ),
        ),
      ),
    );
  }
}
