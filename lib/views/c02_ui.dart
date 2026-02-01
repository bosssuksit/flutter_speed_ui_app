import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/c03_ui.dart';

class C02Ui extends StatefulWidget {
  const C02Ui({super.key});

  @override
  State<C02Ui> createState() => _C02UiState();
}

class _C02UiState extends State<C02Ui> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(height: 70),

                  // --- Logo Section ---
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF00C853), width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'H',
                        style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00C853)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text('Sign in your account',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),

                  // --- Input Fields ---
                  _buildInputLabel('Email'),
                  const SizedBox(height: 8),
                  TextField(
                      controller: _emailController,
                      decoration: _inputStyle('ex: jon.smith@email.com')),
                  const SizedBox(height: 20),

                  _buildInputLabel('Password'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: _inputStyle('*********').copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey),
                        onPressed: () => setState(
                            () => _isPasswordVisible = !_isPasswordVisible),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- Sign In Button ---
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00C853),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 25),
                  const Text('or sign in with',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 25),

                  // --- Social Buttons (จุดที่แก้ไขรูปภาพ) ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png'),
                      const SizedBox(width: 20),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                      const SizedBox(width: 20),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/X_logo_2023.svg/1200px-X_logo_2023.svg.png'),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // --- Sign Up Link ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? ",
                          style: TextStyle(color: Colors.grey)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const C03Ui()));
                        },
                        child: const Text('SIGN UP',
                            style: TextStyle(
                                color: Color(0xFF00C853),
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Back Button
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  Widget _buildInputLabel(String label) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(label,
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500)));
  }

  InputDecoration _inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFF8F8F8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    );
  }

  Widget _socialButton(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 55,
      width: 75,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        // เพิ่มส่วนนี้เพื่อป้องกันแอปค้าง/แดง ถ้า URL มีปัญหา
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2)));
        },
      ),
    );
  }
}
