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
      // ใช้ Stack เพื่อให้ปุ่มย้อนกลับวางทับบน SingleChildScrollView ได้
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  const SizedBox(
                      height: 70), // เพิ่ม Gap ด้านบนให้หลบปุ่มย้อนกลับ

                  // --- ส่วนของ Logo และ Form เหมือนเดิม ---
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                          'https://p7.hiclipart.com/preview/209/923/21/google-logo-google-search-advertising-google-thumbnail.jpg'),
                      const SizedBox(width: 20),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                      const SizedBox(width: 20),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png'),
                    ],
                  ),
                  const SizedBox(height: 50),

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

            // 1. ส่วนปุ่มย้อนกลับ (Back Button)
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context); // กดย้อนกลับไปหน้าก่อนหน้า
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets เหมือนเดิม ---
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
      child: Image.network(imageUrl, fit: BoxFit.contain),
    );
  }
}
