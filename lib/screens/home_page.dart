import 'package:flutter/material.dart';
import 'package:navbar_pages/screens/users_data.dart';
import 'package:navbar_pages/widgets/alert_dialog.dart';
import 'package:navbar_pages/widgets/dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<String> fetchData() async {
  //   await Future.delayed(Duration(seconds: 3));
  //   return "Data Loaded";
  // }

  void _launchURL() {
    const url = 'https://youtube.com';
    launchUrl(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'Welcome to homepage',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
            ),
          ),
          const Expanded(child: DropDownSearch()),
          // const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/ebs');
                },
                child: const Text('About Us'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchURL,
                child: const Text('Open URL'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersData(),
                    ),
                  );
                },
                child: const Text('Show User Data'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Colors.blue,
                color: Colors.amber,
                value: 0.70,
              ),
              SizedBox(width: 20),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/7/77/Avatar_cat.png'),
              ),
            ],
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
