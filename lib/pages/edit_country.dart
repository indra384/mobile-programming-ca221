import 'package:flutter/material.dart';
import '../models/country.dart';

class EditCountryScreen extends StatefulWidget {
  final Country country;

  const EditCountryScreen({super.key, required this.country});

  @override
  State<EditCountryScreen> createState() => _EditCountryScreenState();
}

class _EditCountryScreenState extends State<EditCountryScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _countryCodeController;
  late TextEditingController _countryNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _flagImageUrlController;

  @override
  void initState() {
    super.initState();
    _countryCodeController = TextEditingController(text: widget.country.countryCode);
    _countryNameController = TextEditingController(text: widget.country.countryName);
    _descriptionController = TextEditingController(text: widget.country.description);
    _flagImageUrlController = TextEditingController(text: widget.country.flagImageUrl);
  }

  @override
  void dispose() {
    _countryCodeController.dispose();
    _countryNameController.dispose();
    _descriptionController.dispose();
    _flagImageUrlController.dispose();
    super.dispose();
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      final updatedCountry = Country(
        countryCode: _countryCodeController.text,
        countryName: _countryNameController.text,
        description: _descriptionController.text,
        flagImageUrl: _flagImageUrlController.text,
      );

      Navigator.pop(context, updatedCountry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Country'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Country Code', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _countryCodeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter country code',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the country code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Country Name', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _countryNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter country name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the country name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Description', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Flag Image URL', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _flagImageUrlController,
                  decoration: const InputDecoration(
                    hintText: 'Enter flag image URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the flag image URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveChanges,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Save Changes',
                      style: TextStyle(color: Colors.white),
                    ),
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
