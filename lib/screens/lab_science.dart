import 'package:flutter/material.dart';
import 'package:navbar_pages/widgets/content_items_widget.dart';
import 'package:navbar_pages/widgets/info_container_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class LabScience extends StatefulWidget {
  const LabScience({super.key});

  @override
  State<LabScience> createState() => _LabScienceState();
}

class _LabScienceState extends State<LabScience> {
  final String phoneNumber = "8801706342468";
  void _launchWhatsApp() async {
    var whatsappUrl = "https://api.whatsapp.com/send?phone=$phoneNumber}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("WhatsApp is not installed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lab Science Diagnostics',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/img/lab_science.jpg'),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'We have to show our official ID',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: Wrap(
                spacing: 5,
                alignment: WrapAlignment.center,
                children: [
                  InfoContainer(icon: Icons.call, label: 'Call'),
                  InfoContainer(icon: Icons.share, label: 'Share'),
                  InfoContainer(icon: Icons.reviews, label: 'Review'),
                  InfoContainer(
                      icon: Icons.wechat_sharp,
                      label: 'Whatsapp',
                      onTap: _launchWhatsApp),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const ContentItems(
                locationIcon: Icons.map,
                title: 'Places where discount are available',
                additionalItems: [
                  {
                    'icon': Icons.location_on,
                    'text': '153/1, Green Road, Panthapath, Dhaka'
                  },
                ]),
            Padding(
              padding: const EdgeInsets.only(left: 46, right: 16),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            ContentItems(
                locationIcon: Icons.computer,
                title: 'Primary Doctor Consultation and report',
                additionalItems: const [
                  {
                    'icon': Icons.turn_right,
                    'text3': 'Disscount: ',
                    'additionalText': 'Free'
                  },
                ]),
            Padding(
              padding: const EdgeInsets.only(left: 46, right: 16),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            ContentItems(
                locationIcon: Icons.computer,
                title: 'Home Delivery Service for Dhaka City',
                additionalItems: const [
                  {
                    'icon': Icons.turn_right,
                    'text3': 'Note: ',
                    'additionalText': 'Conveyance Charge applicable',
                    'icon2': Icons.turn_right,
                    'text2': 'Disscount: ',
                    'additionalText2': '5%-7%'
                  },
                ]),
            Padding(
              padding: const EdgeInsets.only(left: 46, right: 16),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            ContentItems(
              locationIcon: Icons.computer,
              title: 'Medicine',
              additionalItems: const [
                {
                  'icon': Icons.turn_right,
                  'text3': 'Disscount: ',
                  'additionalText': '5%-7%'
                },
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46, right: 16),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            ContentItems(
              locationIcon: Icons.computer,
              title: 'Molecular test',
              additionalItems: const [
                {
                  'icon': Icons.turn_right,
                  'text3': 'Disscount: ',
                  'additionalText': 'As per negotiation'
                },
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 46, right: 16),
              child: Divider(thickness: 1, color: Colors.grey),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
