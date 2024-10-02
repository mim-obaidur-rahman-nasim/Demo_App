import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:navbar_pages/screens/user_detail_page.dart';

class UserCard extends StatelessWidget {
  final String title;
  final String body;

  const UserCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailPage(
                        title: title,
                        body: body,
                      ),
                    ),
                  );
                },
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.share, color: Colors.blue),
                  onPressed: () {
                    Share.share('$title\n\n$body');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
