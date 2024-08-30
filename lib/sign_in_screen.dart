import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_provider.dart'; // Import the user provider

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

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
            color: Colors.orange, // Orange container for the "Sign In" text
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
                SizedBox(height: 40.0), // Increased space between the "Sign In" text and the icons
              ],
            ),
          ),
          SizedBox(height: 20.0), // Space before "Welcome Back"
          // Welcome Back text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding around the welcome text
            child: Text(
              'Welcome Back',
              style: TextStyle(
                color: Colors.orange, // Color to match the theme
                fontSize: 28.0, // Font size for the welcome text
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0), // Space between welcome text and subtitle
          // Subtitle text with black color
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding around the subtitle
            child: Text(
              'Glad to see you back my buddy',
              style: TextStyle(
                color: Colors.black, // Change text color to black
                fontSize: 16.0, // Font size for the subtitle
              ),
            ),
          ),
          SizedBox(height: 20.0), // Space between subtitle and email input
          // Email and Password fields
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Email container with icon
                Container(
                  width: 300, // Set a fixed width for the container
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange, // Orange background for email input
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 8.0, // Blur radius
                        offset: Offset(0, 4), // Shadow offset
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.white), // Email icon
                      SizedBox(width: 8.0), // Small space (8.0) between icon and text field
                      Expanded(
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: InputBorder.none, // Remove underline
                          ),
                          style: TextStyle(color: Colors.white), // Change text color to white
                          cursorColor: Colors.white, // Cursor color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0), // Space between email and password
                // Password container with icon
                Container(
                  width: 300, // Set a fixed width for the container
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.orange, // Orange background for password input
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Shadow color
                        blurRadius: 8.0, // Blur radius
                        offset: Offset(0, 4), // Shadow offset
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: Colors.white), // Password lock icon
                      SizedBox(width: 8.0), // Space between icon and text field
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            border: InputBorder.none, // Remove underline
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText; // Toggle visibility
                                });
                              },
                            ),
                          ),
                          style: TextStyle(color: Colors.white), // Change text color to white
                          cursorColor: Colors.white, // Cursor color
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
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
