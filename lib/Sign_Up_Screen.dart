import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/user_provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
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
            SizedBox(height: 20.h),
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
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
