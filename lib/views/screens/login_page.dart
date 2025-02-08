import 'package:femina/views/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'consent_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    // Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF6CDCD),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF641D15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Email TextField
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        hintText: 'Enter your email',
                        hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Password TextField
                    TextField(
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF7F8F9),
                        hintText: 'Enter your password',
                        hintStyle: const TextStyle(color: Color(0xFF8391A1)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible ? Icons.visibility : Icons.visibility_off,
                            color: const Color(0xFF8391A1),
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Centered Login Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ConsentPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD55454),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // OR Login With (With Lines)
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or login with",
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade400, thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Social Media Login Buttons (Equally Spaced from Corners & Each Other)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _socialLoginButton('assets/icon/google_logo.png'),
                          _socialLoginButton('assets/icon/apple_logo.png'),
                          _socialLoginButton('assets/icon/facebook_logo.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30), // Adjusted spacing

          // Don't Have an Account? Register Now (Higher Up)
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: "Register now",
                        style: TextStyle(
                          color: Color(0xFFD55454),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Social Login Button Widget
  Widget _socialLoginButton(String asset) {
    return Container(
      height: 60, // Slightly bigger
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Image.asset(asset, height: 30),
      ),
    );
  }
}