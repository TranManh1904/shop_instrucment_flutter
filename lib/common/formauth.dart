import 'package:flutter/material.dart';

class AskMeAnythingScreen extends StatefulWidget {
  @override
  _AskMeAnythingScreenState createState() => _AskMeAnythingScreenState();
}

class _AskMeAnythingScreenState extends State<AskMeAnythingScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Ask Me\nAnything!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7A9B76),
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 30),

                // Description
                Text(
                  'Feel free to ask my any question about my travels, blog or if you have any business inquires. Fill out the form below or send me an email to ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    // Handle email tap
                    print('Email tapped');
                  },
                  child: Text(
                    'tranducmanh6303@email.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF7A9B76),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // Name field
                _buildTextField(
                  controller: _nameController,
                  hintText: 'Name*',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // Email field
                _buildTextField(
                  controller: _emailController,
                  hintText: 'E-mail*',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    ).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // Message field
                _buildTextField(
                  controller: _messageController,
                  hintText: 'Your message',
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 30),

                // Submit button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF7A9B76),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                    ),
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        iconColor: Colors.black,
        filled: true,
        fillColor: Color(0xFFF0F0F0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFF7A9B76), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }

  void _submitForm() {
    // Handle form submission
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Thank you!'),
        content: Text('Your message has been sent successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Clear form
              _nameController.clear();
              _emailController.clear();
              _messageController.clear();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
