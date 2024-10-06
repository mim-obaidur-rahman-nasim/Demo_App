import 'package:flutter/material.dart';

class DatetimeField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;

  const DatetimeField({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
  });

  @override
  State<DatetimeField> createState() => _DatetimeFieldState();
}

class _DatetimeFieldState extends State<DatetimeField> {
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
              children: [
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (pickedDate != null && pickedTime != null) {
                      DateTime combinedDateTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      widget.controller.text = combinedDateTime.toString();
                      setState(() {});
                    }
                  },
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: widget.controller,
                      decoration: InputDecoration(
                        hintText: widget.controller.text.isEmpty
                            ? widget.hintText
                            : null,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
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
