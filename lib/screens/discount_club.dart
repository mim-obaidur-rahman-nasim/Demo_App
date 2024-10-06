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
            children: const [
              FilterOptions(),
              SizedBox(height: 10),
              SearchBarWidget(),
              SizedBox(height: 10),
              DiscountCards()
            ],
          ),
        ),
      ),
    );
  }
}
