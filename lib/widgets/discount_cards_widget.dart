// import 'package:flutter/material.dart';

// class DiscountCards extends StatelessWidget {
//   const DiscountCards({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       childAspectRatio: 3 / 4,
//       children: const [
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Lab Science Diagnostics Center',
//           category: 'Medical',
//           location: '1205-Newmarket, Dhaka',
//         ),
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Care-Box Limited',
//           category: 'Medical',
//           location: '1215-Tejgaon, Dhaka',
//         ),
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Rainy Roof Restaurant',
//           category: 'Restaurant',
//           location: '1215-Tejgaon, Dhaka',
//         ),
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Parjatan Motel Rajshahi',
//           category: 'Hotel',
//           location: '6000-Rajpara, Rajshahi',
//         ),
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Puro Foods Limited',
//           category: 'Restaurant',
//           location: 'Anywhere in Bangladesh',
//         ),
//         DiscountCard(
//           imagePath: 'assets/img/logo.png',
//           title: 'Praava Health',
//           category: 'Medical',
//           location: '1212-Gulshan, Dhaka',
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final String location;

  const DiscountCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: 55,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.black)),
              child: Text(
                category,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        location,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCards extends StatelessWidget {
  final List<Map<String, String>> cards;

  const DiscountCards({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 3 / 4,
      children: cards.map((card) {
        return DiscountCard(
          imagePath: card['imagePath']!,
          title: card['title']!,
          category: card['category']!,
          location: card['location']!,
        );
      }).toList(),
    );
  }
}
