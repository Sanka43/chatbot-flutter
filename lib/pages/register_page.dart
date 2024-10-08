import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffe0e1ff), Color(0xffee876d), Color(0xff5d9ed0)],
            stops: [0, 0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Define width for different screen sizes
              double containerWidth;
              double containerHeight = 300;

              if (constraints.maxWidth < 600) {
                // Mobile layout
                containerWidth = constraints.maxWidth * 0.85;
              } else if (constraints.maxWidth < 1024) {
                // Tablet layout
                containerWidth = constraints.maxWidth * 0.6;
              } else {
                // Desktop layout
                containerWidth = 400;
              }

              return Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Centers vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Centers horizontally
                    children: [
                      TextField(
                        controller: _emailController,
                        style: const TextStyle(
                            color:
                                Colors.white), // Sets the text color to white
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors
                                  .white), // Sets the label color to white
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Border color when enabled
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Border color when focused
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: true, // To hide the password input
                        style: const TextStyle(
                            color:
                                Colors.white), // Sets the text color to white
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              color: Colors
                                  .white), // Sets the label color to white
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Border color when enabled
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Colors.white), // Border color when focused
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add registration logic here
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text('Register'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: Text(
                          'Already have an account? Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
