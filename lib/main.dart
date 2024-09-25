import 'package:flutter/material.dart';
import 'package:navbar_pages/screens/ebs.dart';
import 'package:navbar_pages/screens/home_page.dart';
import 'package:navbar_pages/widgets/contact_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyItems = [
      const HomeScreen(),
      const Center(child: Text('This is menu')),
      SingleChildScrollView(
        child: Column(
          children: const [
            ContactCard(
              image: 'assets/img/mobile-01.jpg',
              name: 'Donna Moore',
              position: 'Sales Executive, Company A',
              address: '481 West Street\n Anytown, OH 45066\n USA',
              email: 'donna_moore@example.com',
            ),
            ContactCard(
              image: 'assets/img/mobile-01.jpg',
              name: 'Donna Moore',
              position: 'Sales Executive, Company A',
              address: '481 West Street\n Anytown, OH 45066\n USA',
              email: 'donna_moore@example.com',
            ),
            ContactCard(
              image: 'assets/img/mobile-01.jpg',
              name: 'Donna Moore',
              position: 'Sales Executive, Company A',
              address: '481 West Street\n Anytown, OH 45066\n USA',
              email: 'donna_moore@example.com',
            ),
            ContactCard(
              image: 'assets/img/mobile-01.jpg',
              name: 'Donna Moore',
              position: 'Sales Executive, Company A',
              address: '481 West Street\n Anytown, OH 45066\n USA',
              email: 'donna_moore@example.com',
            ),
            ContactCard(
              image: 'assets/img/mobile-01.jpg',
              name: 'Donna Moore',
              position: 'Sales Executive, Company A',
              address: '481 West Street\n Anytown, OH 45066\n USA',
              email: 'donna_moore@example.com',
            ),
          ],
        ),
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/ebs': (context) => const EbS(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Appbar'),
          backgroundColor: const Color.fromARGB(255, 91, 178, 222),
        ),
        body: Center(
          child: bodyItems[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Menu',
              icon: Icon(Icons.menu),
            ),
            BottomNavigationBarItem(
              label: 'Contacts',
              icon: Icon(Icons.contact_phone),
            ),
          ],
        ),
      ),
    );
  }
}
