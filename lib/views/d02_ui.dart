import 'package:flutter/material.dart';
// Import หน้าที่เกี่ยวข้อง
import 'package:flutter_speed_ui_app_test/views/d03_ui.dart';
import 'package:flutter_speed_ui_app_test/views/d04_ui.dart';

class D02Ui extends StatefulWidget {
  const D02Ui({super.key});

  @override
  State<D02Ui> createState() => _D02UiState();
}

class _D02UiState extends State<D02Ui> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // 1. ปุ่มย้อนกลับ
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 30),

              // 2. หัวข้อ Welcome back
              const Text(
                'Welcome back! Glad\nto see you, Again!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E232C),
                ),
              ),
              const SizedBox(height: 40),

              // 3. ช่อง Email
              _buildInput('Enter your email'),
              const SizedBox(height: 15),

              // 4. ช่อง Password พร้อมปุ่มเปิด-ปิดตา
              TextField(
                obscureText: _obscureText,
                decoration: _inputStyle('Enter your password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xFF6A707C),
                    ),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  ),
                ),
              ),

              // 5. ลิงก์ลืมรหัสผ่าน (เชื่อมไปหน้า D04)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const D04Ui()),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color(0xFF6A707C), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 6. ปุ่ม Login
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2027),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 35),

              // 7. ส่วน Or Login with
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or Login with',
                          style: TextStyle(color: Color(0xFF6A707C)))),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 30),

              // 8. Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                  const SizedBox(width: 20),
                  _socialCard(
                      'https://p7.hiclipart.com/preview/209/923/21/google-logo-google-search-advertising-google-thumbnail.jpg'),
                  const SizedBox(width: 20),
                  _socialCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/600px-Apple_logo_black.svg.png'),
                ],
              ),
              const SizedBox(height: 40),

              // 9. ลิงก์ไปหน้าสมัครสมาชิก (เชื่อมไปหน้า D03)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style: TextStyle(color: Color(0xFF1E232C))),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const D03Ui()),
                      );
                    },
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          color: Color(0xFF34C2C1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---
  InputDecoration _inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF8391A1)),
      filled: true,
      fillColor: const Color(0xFFF7F8F9),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFF34C2C1)),
      ),
    );
  }

  Widget _buildInput(String hint) {
    return TextField(decoration: _inputStyle(hint));
  }

  Widget _socialCard(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 55,
      width: 85,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8ECF4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(imageUrl, fit: BoxFit.contain),
    );
  }
}
