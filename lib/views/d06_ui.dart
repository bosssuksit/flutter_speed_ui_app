import 'package:flutter/material.dart';
// 1. เพิ่มการ import หน้า d07
import 'package:flutter_speed_ui_app_test/views/d07_ui.dart';

class D06Ui extends StatefulWidget {
  const D06Ui({super.key});

  @override
  State<D06Ui> createState() => _D06UiState();
}

class _D06UiState extends State<D06Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Create new password',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E232C),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Your new password must be unique from those previously used.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8391A1),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),
              _buildPasswordField('New Password'),
              const SizedBox(height: 15),
              _buildPasswordField('Confirm Password'),
              const SizedBox(height: 40),

              // 2. อัปเดตปุ่ม Reset Password ให้ไปหน้า D07Ui
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const D07Ui()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2027),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String hint) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF8391A1)),
        filled: true,
        fillColor: const Color(0xFFF7F8F9),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF34C2C1)),
        ),
      ),
    );
  }
}
