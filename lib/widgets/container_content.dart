import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final String title;

  const CustomWidget(this.title, {super.key});

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: const Color.fromARGB(255, 57, 104, 199), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 60,
      width: 210,
      child: Center(
        child: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
