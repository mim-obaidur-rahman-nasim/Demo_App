import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const InputField({super.key, 
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            radius: 22,
            child: Icon(widget.icon, size: 24, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4),
                TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText:
                        widget.controller.text.isEmpty ? widget.hintText : null,
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                Visibility(
                  visible: widget.controller.text.isNotEmpty,
                  child: Text(widget.hintText,
                      style: TextStyle(color: Colors.grey)),
                ),
                const Divider(thickness: 1.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
