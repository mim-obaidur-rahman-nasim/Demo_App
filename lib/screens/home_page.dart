import 'package:flutter/material.dart';
import 'package:navbar_pages/widgets/alert_dialog.dart';
import 'package:navbar_pages/widgets/dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _launchURL() {
    const url = 'https://youtube.com';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'This is homepage',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/ebs');
          },
          child: const Text('About Us'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialogBox();
              },
            );
          },
          child: const Text('Show Alert Dialog'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Open URL'),
        ),
        const SizedBox(height: 20),
        const Expanded(child: DropDownSearch()),
        CircularProgressIndicator(
          backgroundColor: Colors.blue,
          color: Colors.amber,
          value: 0.70,
        ),
        const SizedBox(height: 80),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png'),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
