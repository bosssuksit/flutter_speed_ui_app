import 'package:flutter/material.dart';

class D03Ui extends StatefulWidget {
  const D03Ui({super.key});

  @override
  State<D03Ui> createState() => _D03UiState();
}

class _D03UiState extends State<D03Ui> {
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
              // ปุ่ม Back
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
              // หัวข้อ
              const Text(
                'Hello! Register to get\nstarted',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E232C),
                ),
              ),
              const SizedBox(height: 35),
              // ช่องกรอกข้อมูลต่างๆ
              _buildTextField('Username'),
              const SizedBox(height: 12),
              _buildTextField('Email'),
              const SizedBox(height: 12),
              _buildTextField('Password', isPassword: true),
              const SizedBox(height: 12),
              _buildTextField('Confirm password', isPassword: true),
              const SizedBox(height: 30),
              // ปุ่ม Register
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2027),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Register',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
              const SizedBox(height: 35),
              // Social Register
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or Register with',
                          style: TextStyle(color: Color(0xFF6A707C)))),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                  const SizedBox(width: 20),
                  _socialCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png'),
                  const SizedBox(width: 20),
                  _socialCard(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/600px-Apple_logo_black.svg.png'),
                ],
              ),
              const SizedBox(height: 40),
              // ลิงก์ไปหน้า Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(color: Color(0xFF1E232C))),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Login Now',
                      style: TextStyle(
                          color: Color(0xFF34C2C1),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
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

  Widget _socialCard(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 55,
      width: 85,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8ECF4)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        // เพิ่ม Error handling และ Loading
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 15,
              height: 15,
              child:
                  CircularProgressIndicator(strokeWidth: 2, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
