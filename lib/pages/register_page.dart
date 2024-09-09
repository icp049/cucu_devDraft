import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
    final DateTime _defaultDate = DateTime.now(); // Default to current date
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
    bool _obscureText = true;


     @override
  void initState() {
    super.initState();
    _dateController.text = "${_defaultDate.toLocal()}".split(' ')[0]; // Set today's date in YYYY-MM-DD format
  }

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
                                  if (currentStep < 3) {
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
            const SizedBox(height: 20),
            Text(
              'Set up your email',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Lets connect you with the world and stay in touch with friends, share spaces and more",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                hintText: 'Your email here',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              
              ),
              validator: (value) {
                
              },
              
            ),
          ],
        );


        case 3:
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          'Set up your password',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          "Your space is personal, so keep it safe!",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            hintText: 'Your password here',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: _clearText,
                ),
                IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: _toggleObscureText,
                ),
              ],
            ),
          ),
          validator: (value) {
            // Add your validation logic here
          },
        ),


          const SizedBox(height: 15),

Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'Your password must have at least:',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 5),
    Row(
      children: [
        Icon(Icons.check, size: 16, color: Colors.green),
        const SizedBox(width: 8),
        Text(
          "8-30 characters long",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.check, size: 16, color: Colors.green),
        const SizedBox(width: 8),
        Text(
          "1 letter and 1 number",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
    Row(
      children: [
        Icon(Icons.check, size: 16, color: Colors.green),
        const SizedBox(width: 8),
        Text(
          "1 special character [Example: . # ? ! &]",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    ),
  ],
)






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
              initialDateTime: _defaultDate, // Use the default date for initialization
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


    void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

   void _clearText() {
    _passwordController.clear();
  }
}
