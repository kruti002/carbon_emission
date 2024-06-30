import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class ManualEntryScreen extends StatefulWidget {
  const ManualEntryScreen({super.key});

  @override
  _ManualEntryScreenState createState() => _ManualEntryScreenState();
}

class _ManualEntryScreenState extends State<ManualEntryScreen> {
  String _selectedTransport = 'Car';
  String _activityType = 'Driving';
  DateTime _selectedDate = DateTime.now();
  XFile? _uploadedImage;
  final List<String> _transportOptions = ['Car', 'Bus', 'Bicycle', 'Walking'];
  final List<String> _activityTypes = ['Driving', 'Cycling', 'Walking'];

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _uploadedImage = pickedFile;
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      print(result.files.single.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual Entry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Manual Entry of Data',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                value: _selectedTransport,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTransport = newValue!;
                  });
                },
                items: _transportOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Select Transportation',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Activity Type',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Column(
                    children: _activityTypes.map((String type) {
                      return RadioListTile<String>(
                        title: Text(type),
                        value: type,
                        groupValue: _activityType,
                        onChanged: (String? value) {
                          setState(() {
                            _activityType = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Text(
                    'Select Date: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  TextButton(
                    onPressed: () => _pickDate(context),
                    child: Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.camera_alt),
                label: Text('Upload Image'),
              ),
              SizedBox(height: 20.0),
              _uploadedImage != null
                  ? Image.file(
                      File(_uploadedImage!.path),
                      height: 200.0,
                    )
                  : Text('No image selected.'),
              SizedBox(height: 20.0),
              ElevatedButton.icon(
                onPressed: _pickFile,
                icon: Icon(Icons.upload_file),
                label: Text('Upload File'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
