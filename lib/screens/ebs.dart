import 'package:flutter/material.dart';
import 'package:navbar_pages/widgets/container_content.dart'; 

class EbS extends StatelessWidget {
  const EbS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 20, bottom: 10),
              child: Image.asset('assets/img/logo.png'),
            ),
            const Text(
              'EBS 1.0.2',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45),
            CustomWidget("Rating"),
            const SizedBox(height: 20),
            CustomWidget("Update"),
            const SizedBox(height: 20),
            CustomWidget("Logged In Device"),
            const SizedBox(height: 20),
            CustomWidget("Support"),
          ],
        ),
      ),
    );
  }
}
