import 'package:flutter/material.dart';
import 'package:navbar_pages/screens/data/contacts_data.dart';
import 'package:navbar_pages/screens/ebs.dart';
import 'package:navbar_pages/screens/home_page.dart';
import 'package:navbar_pages/screens/login_page.dart';
import 'package:navbar_pages/screens/signup_page.dart';
import 'package:navbar_pages/screens/splash_screen.dart';
import 'package:navbar_pages/screens/webview_page.dart';
import 'package:navbar_pages/widgets/contact_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/signup_page': (context) => SignupPage(),
        '/login_page': (context) =>  LoginPage(),
        '/home_page': (context) => const MainApp(),
        '/ebs': (context) => const EbS(),
      },
      home: SplashScreen(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _logout() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    sharePref.setBool(SplashScreenState.KEYLOGIN, false);
    Navigator.pushReplacementNamed(context, '/login_page');
  }

  final List<Widget> bodyItems = [
    const HomeScreen(),
    const WebviewPage(),
    SingleChildScrollView(
      child: Column(
        children: contacts.map((contact) {
          return ContactCard(
            image: contact.image,
            name: contact.name,
            position: contact.position,
            address: contact.address,
            email: contact.email,
          );
        }).toList(),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
        backgroundColor: const Color.fromARGB(255, 91, 178, 222),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: _logout,
              label: const Text('Logout'),
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: bodyItems[_currentIndex],
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
            label: 'Webview',
            icon: Icon(Icons.web),
          ),
          BottomNavigationBarItem(
            label: 'Contacts',
            icon: Icon(Icons.contact_phone),
          ),
        ],
      ),
    );
  }
}
