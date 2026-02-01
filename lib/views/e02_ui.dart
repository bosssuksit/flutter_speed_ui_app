import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/e03_ui.dart';
// 1. นำเข้าไฟล์หน้า E04
import 'package:flutter_speed_ui_app_test/views/e04_ui.dart';

class E02Ui extends StatefulWidget {
  const E02Ui({super.key});

  @override
  State<E02Ui> createState() => _E02UiState();
}

class _E02UiState extends State<E02Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1557800636-894a64c1696f?q=80&w=1965',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white54,
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Welcome back',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Text(
                    'Login to your account',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField('Enter email or phone'),
                  const SizedBox(height: 15),
                  _buildTextField('Password', isPassword: true),

                  // แก้ไขจุดนี้: นำทางไปหน้า E04
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const E04Ui()),
                        );
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Color(0xFFF7941D)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ... ปุ่ม Login และส่วนอื่นๆ เหมือนเดิม ...
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFFC529), Color(0xFFF7941D)],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text('OR',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialIcon(
                          'https://cdn-icons-png.flaticon.com/512/300/300221.png'),
                      const SizedBox(width: 25),
                      _socialIcon(
                          'https://cdn-icons-png.flaticon.com/512/5968/5968764.png'),
                      const SizedBox(width: 25),
                      _socialIcon(
                          'https://cdn-icons-png.flaticon.com/512/0/747.png'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an Account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const E03Ui()),
                          );
                        },
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                              color: Color(0xFFF7941D),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black26),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off_outlined, color: Colors.black26)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFF7941D)),
        ),
      ),
    );
  }

  Widget _socialIcon(String url) {
    return Image.network(url, height: 35);
  }
}
