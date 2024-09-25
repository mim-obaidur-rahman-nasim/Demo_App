import 'package:flutter/material.dart';

class ContactCard extends StatefulWidget {
  final String name;
  final String position;
  final String address;
  final String email;
  final String image;

  const ContactCard({
    super.key,
    required this.name,
    required this.position,
    required this.address,
    required this.email,
    required this.image,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 242, 241, 238),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(widget.image),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.position,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.address,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
