import 'package:flutter/material.dart';

class B03Ui extends StatefulWidget {
  const B03Ui({super.key});

  @override
  State<B03Ui> createState() => _B03UiState();
}

class _B03UiState extends State<B03Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 1. ตกแต่งพื้นหลัง (วงกลมจางๆ)
          Positioned(
            top: -150,
            right: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF1F4FF).withOpacity(0.5),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  // หัวข้อหลัก
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F41BB),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Create an account so you can explore all the existing jobs',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // 2. ช่อง Email (พร้อมขอบสีน้ำเงินเมื่อ Active)
                  _buildTextField(hint: 'Email'),
                  const SizedBox(height: 20),

                  // 3. ช่อง Password
                  _buildTextField(hint: 'Password', isPassword: true),
                  const SizedBox(height: 20),

                  // 4. ช่อง Confirm Password
                  _buildTextField(hint: 'Confirm Password', isPassword: true),

                  const SizedBox(height: 50),

                  // 5. ปุ่ม Sign up (มีเงาสวยงาม)
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF1F41BB).withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F41BB),
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ปุ่มกลับไป Login
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Already have an account',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                  const Text(
                    'Or continue with',
                    style: TextStyle(
                        color: Color(0xFF1F41BB), fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // 6. Social Buttons (จัดรูปแบบใหม่)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton('G'), // แทนด้วยไอคอน Google
                      const SizedBox(width: 15),
                      _socialButton('f'), // แทนด้วยไอคอน Facebook
                      const SizedBox(width: 15),
                      _socialButton('A'), // แทนด้วยไอคอน Apple
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // ปุ่มกดย้อนกลับ (มุมบนซ้าย)
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget สำหรับสร้าง TextField เพื่อลดความซ้ำซ้อนของโค้ด
  Widget _buildTextField({required String hint, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFFF1F4FF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1F41BB), width: 2),
        ),
      ),
    );
  }

  // Widget สำหรับปุ่ม Social
  Widget _socialButton(String label) {
    return Container(
      width: 60,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFECECEC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
