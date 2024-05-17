import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signin_1/profile.dart';

class Chappak extends StatefulWidget {
  const Chappak({Key? key}) : super(key: key);

  @override
  State<Chappak> createState() => _ChappakState();
}

class _ChappakState extends State<Chappak> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fname = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register() async {
    try {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();
      String address = _addressController.text.trim();
      String phone = _phoneController.text.trim();
      String fname = _fname.text.trim();

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Passwords do not match')),
        );
        return;
      }

      // Create user
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user details in Firestore
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'address': address,
        'phone': phone,
        'fname': fname,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to register: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/image5.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.1,
                left: screenWidth * 0.05,
                right: screenWidth * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.10,
                      bottom: screenHeight * 0.04,
                    ),
                    child: Text(
                      'Add Details',
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  _buildTextField(_nameController, 'Name', screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_emailController, 'Email', screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_passwordController, 'Password', screenHeight, obscureText: true),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_confirmPasswordController, 'Confirm Password', screenHeight, obscureText: true),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_addressController, 'Address', screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_phoneController, 'Phone', screenHeight),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(_fname, 'ID', screenHeight),
                  SizedBox(height: screenHeight * 0.06),
                  Container(
                    height: screenHeight * 0.07,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black87),
                        shape: MaterialStateProperty.all(BeveledRectangleBorder()),
                      ),
                      onPressed: _register,
                      child: Text(
                        'N e x t',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenHeight * 0.019,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, double screenHeight, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscureText,
      style: TextStyle(fontSize: screenHeight * 0.02),
    );
  }
}
