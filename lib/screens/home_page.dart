import 'package:flutter/material.dart';
import 'package:navbar_pages/widgets/alert_dialog.dart';
import 'package:navbar_pages/widgets/dropdown_search.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return "Data Loaded";
  }

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
          'Welcome to homepage',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        const Expanded(child: DropDownSearch()),
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
          onPressed: () {
            Navigator.pushNamed(context, '/ebs');
          },
          child: const Text('About Us'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Open URL'),
        ),
        const SizedBox(height: 20),
        FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text(snapshot.data ??
                  ""); //Instead of toString we can use that also
            }
          },
        ),
        const SizedBox(height: 20),
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
