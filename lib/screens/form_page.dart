import 'package:flutter/material.dart';
import 'package:navbar_pages/screens/saved_data.dart';
import 'package:navbar_pages/widgets/datetime_field_widget.dart';
import 'package:navbar_pages/widgets/drop_down_widget.dart';
import 'package:navbar_pages/widgets/input_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();
  final TextEditingController agendaController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String? selectedRelated;
  String? selectedAssignedTo;
  String? selectedAttendees;
  String? selectedDuration;
  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      titleController.text = prefs.getString('subject') ?? '';
      dateTimeController.text = prefs.getString('dateTime') ?? '';
      agendaController.text = prefs.getString('agenda') ?? '';
      locationController.text = prefs.getString('location') ?? '';
      descriptionController.text = prefs.getString('description') ?? '';
      selectedRelated = prefs.getString('selectedRelated') ?? '';
      selectedAssignedTo = prefs.getString('selectedAssignedTo') ?? '';
      selectedAttendees = prefs.getString('selectedAttendees') ?? '';
      selectedDuration = prefs.getString('selectedDuration') ?? '';
      selectedStatus = prefs.getString('selectedStatus') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meeting Info',
            style: TextStyle(
                color: Colors.blue.shade800, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              InputField(
                icon: Icons.bookmark_border,
                hintText: 'Subject',
                controller: titleController,
              ),
              DatetimeField(
                  controller: dateTimeController,
                  icon: Icons.date_range,
                  hintText: 'Start date & time'),
              DropDownSearchWidget(
                icon: Icons.person,
                hintText: "Related",
                items: const ["Item 1", "Item 2", "Item 3"],
                onChanged: (value) {
                  setState(() {
                    selectedRelated = value;
                  });
                },
              ),
              DropDownSearchWidget(
                icon: Icons.edit_document,
                hintText: "Selected related first",
                items: const ["Item 1", "Item 2", "Item 3"],
                onChanged: (value) {
                  setState(() {
                    selectedAttendees = value;
                  });
                },
              ),
              InputField(
                icon: Icons.difference_outlined,
                hintText: 'Agenda',
                controller: agendaController,
              ),
              DropDownSearchWidget(
                icon: Icons.person,
                hintText: "Assigned to",
                items: const [
                  "Md. Sakibul Hasan",
                  "Alamin Shawon",
                  "Obaidur Rahman"
                ],
                onChanged: (value) {
                  setState(() {
                    selectedAssignedTo = value;
                  });
                },
              ),
              DropDownSearchWidget(
                icon: Icons.edit_document,
                hintText: "Duration",
                items: const [
                  "00:15",
                  "00:30",
                  "01:00",
                  "01:30",
                  "02:00",
                  "02:30",
                  "03:00",
                  "03:30",
                  "04:00",
                  "04:30",
                  "05:00",
                  "05:30",
                  "06:00",
                  "06:30",
                  "07:00",
                  "07:30",
                  "08:00",
                  "08:30",
                  "09:00",
                  "09:30",
                  "10:00"
                ],
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value;
                  });
                },
              ),
              InputField(
                icon: Icons.location_on,
                hintText: 'Location',
                controller: locationController,
              ),
              DropDownSearchWidget(
                icon: Icons.check_box,
                hintText: "Status",
                items: const ["Item 1", "Item 2", "Item 3"],
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                },
              ),
              InputField(
                icon: Icons.description,
                hintText: 'Description',
                controller: descriptionController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Save',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  List<String> itemsToSave = [
                    titleController.text,
                    dateTimeController.text,
                    agendaController.text,
                    locationController.text,
                    descriptionController.text,
                    selectedRelated ?? '',
                    selectedAssignedTo ?? '',
                    selectedAttendees ?? '',
                    selectedDuration ?? '',
                    selectedStatus ?? ''
                  ];

                  await prefs.setStringList('items', itemsToSave);
                  print('Saved Values: $itemsToSave');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedData(savedData: itemsToSave),
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Data saved successfully!')),
                  );
                },
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
