import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _dateController = TextEditingController(); // Initialized

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Create Account"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: MediaQuery.of(context).viewInsets.bottom, // Adjusts padding based on keyboard height
                  ),
                  child: Form(
                    key: _formKey, // Form key to manage form state
                    child: Column(
                      children: [
                        getStepContent(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (currentStep != 0)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    currentStep--;
                                  });
                                },
                                child: Text('Back'),
                              ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (currentStep < 2) {
                                    setState(() {
                                      currentStep++;
                                    });
                                  } else {
                                    // Submit the form
                                    // Register form submission logic here
                                  }
                                }
                              },
                              child: Text(currentStep < 2 ? 'Continue' : 'Submit'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );

  // Widget that shows different content based on current step
  Widget getStepContent() {
    switch (currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Tell us your name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "It's the first step to making your app truly yours",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                hintText: 'Your name here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                counterText: '${_nameController.text.length}/30',
              ),
              maxLength: 30, // Enforces a maximum length of 30 characters
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a username';
                } else if (value.length > 30) {
                  return 'Username cannot exceed 30 characters';
                }
                return null;
              },
              onChanged: (text) {
                setState(() {}); // Rebuild to update the counter text
              },
            ),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Mark your calendar with us',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Your birthday helps us make Cucú more personal",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _showCupertinoDatePicker(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Review & Submit', style: TextStyle(fontSize: 18)),
            // Display collected data for review
            Text('Name: ${_nameController.text}'),
            Text('Email: ${_emailController.text}'),
            Text('Address: ${_addressController.text}, ${_cityController.text}, ${_postalCodeController.text}'),
            Text('Postal Code: ${_postalCodeController.text}'),
            Text('Selected Date: ${_dateController.text}'),
          ],
        );
      default:
        return Container();
    }
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text('Select Date'),
        actions: [
          Container(
            height: 200,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                  _dateController.text = "${newDate.toLocal()}".split(' ')[0]; // Format the date as YYYY-MM-DD
                });
              },
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
