import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isChecked = false; // State variable for the checkbox
  String? _selectedGender; // State variable for gender selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the entire form
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align items to the start
            children: [
              const SizedBox(height: 20),
              const Image(
                image: AssetImage('assets/Bot.png'),
                height: 150, // Set a height for the image
              ),
              const SizedBox(height: 20),
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildFullNameFields(Icons.person_2, TextInputType.name),
              const SizedBox(height: 10),
              _buildTextField(
                  Icons.location_on_outlined, 'Region', TextInputType.text),
              const SizedBox(height: 10),
              _buildTextField(Icons.location_city, 'City', TextInputType.text),
              const SizedBox(height: 10),
              _buildTextField(
                  Icons.phone_rounded, 'Phone', TextInputType.phone),
              const SizedBox(height: 10),
              _buildGenderRadioButtons(), // Radio buttons for gender
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue ?? false; // Update checkbox state
                      });
                    },
                  ),
                  const Text('I Agree to the terms and conditions'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle signup logic here
                  if (_isChecked && _selectedGender != null) {
                    // Proceed with signup logic
                    print(
                        "Signup successful! Gender: $_selectedGender"); // Replace with actual signup code
                  } else {
                    // Show a message if the checkbox is not checked or gender is not selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Please agree to the terms and select a gender.')),
                    );
                  }
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields for first and last name
  Widget _buildFullNameFields(IconData icon, TextInputType inputType) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Expanded(
                // First Name Field
                child: TextFormField(
                  keyboardType: inputType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
              const SizedBox(width: 10), // Space between the fields
              Expanded(
                // Last Name Field
                child: TextFormField(
                  keyboardType: inputType,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Method to build a TextFormField
  Widget _buildTextField(IconData icon, String label, TextInputType inputType) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            keyboardType: inputType,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
            ),
          ),
        ),
      ],
    );
  }

  // Method to build radio buttons for gender selection
  Widget _buildGenderRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Radio<String>(
              value: 'Male',
              groupValue: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const Text('Male'),
            const SizedBox(width: 20),
            Radio<String>(
              value: 'Female',
              groupValue: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const Text('Female'),
            const SizedBox(width: 20),
            Radio<String>(
              value: 'Other',
              groupValue: _selectedGender,
              onChanged: (String? value) {
                setState(() {
                  _selectedGender = value;
                });
              },
            ),
            const Text('Other'),
          ],
        ),
      ],
    );
  }
}
