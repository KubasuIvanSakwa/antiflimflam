import 'package:flutter/material.dart';
import 'package:antiflimflam/components/dashboard.dart';
import 'package:antiflimflam/components/my_button.dart';
import 'package:antiflimflam/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _showPassword = false;

  // Function to sign user in
  void signUserIn(BuildContext context) {
    // Dummy username and password for demonstration
    String dummyUsername = 'musenya';
    String dummyPassword = 'musenya123';

    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    if (enteredUsername == dummyUsername && enteredPassword == dummyPassword) {
      // Navigate to Dashboard upon successful login
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashboard(),
        ),
      );
    } else {
      // Show error dialog for incorrect credentials
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                const SizedBox(height: 50),

                //Welcome Text
                Text(
                  "Antiflimflam Tracking System",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 40),

                const Text(
                  'Login Page',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),

                const SizedBox(height: 40),

                //username Text field
                MyTextField(
                  controller: usernameController,
                  hintText: "Username",
                  obscureText: false,
                ),

                //password Text field
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: !_showPassword,
                ),

                // Checkbox to show password

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: _showPassword,
                        onChanged: (newValue) {
                          setState(() {
                            _showPassword = newValue!;
                          });
                        },
                      ),
                      const Text('Show Password'),

                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                MyButton(
                  text: const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => signUserIn(context), // Pass BuildContext to signUserIn
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
