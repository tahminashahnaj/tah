import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart'; // Import the user provider

class SignInScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Orange background for the app bar
        title: Text(''), // Empty title to keep app bar minimal
      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange, // Make the whole area orange
            width: double.infinity, // Full width
            padding: EdgeInsets.all(16.0), // Padding around the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0), // Space between the "Sign In" text and the email field
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<UserProvider>(context, listen: false).setUser(
                      UserModel(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                    // Navigate to another screen or show a success message
                  },
                  child: Text('Sign In'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the Sign Up screen
                  },
                  child: Text('Don\'t have an account? Sign Up'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
