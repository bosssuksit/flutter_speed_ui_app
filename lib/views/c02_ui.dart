import 'package:flutter/material.dart';
// อย่าลืม import หน้า C03 มาด้วยนะครับ
// import 'package:your_project_name/views/c03_ui.dart';

class C02Ui extends StatefulWidget {
  const C02Ui({super.key});

  @override
  State<C02Ui> createState() => _C02UiState();
}

class _C02UiState extends State<C02Ui> {
  // เพิ่ม Controller สำหรับรับค่าจากช่องกรอก
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // สำหรับเปิด/ปิดการมองเห็นรหัสผ่าน

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 50),
              // 1. โลโก้ตัว H สีเขียว
              Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF00C853), width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    'H',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00C853),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Sign in your account',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),

              // 3. ช่องกรอก Email
              _buildInputLabel('Email'),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: _inputStyle('ex: jon.smith@email.com'),
              ),
              const SizedBox(height: 20),

              // 4. ช่องกรอก Password
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
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
              ),

              // เพิ่ม Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot your password?',
                      style: TextStyle(color: Color(0xFF00C853))),
                ),
              ),
              const SizedBox(height: 20),

              // 5. ปุ่ม SIGN IN
              ElevatedButton(
                onPressed: () {
                  // ใส่ Logic การ Login ตรงนี้
                  print('Email: ${_emailController.text}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C853),
                  minimumSize: const Size(double.infinity, 55),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),
              const Text('or sign in with',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),

              // 6. ปุ่ม Social Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton(
                      'https://p7.hiclipart.com/preview/209/923/21/google-logo-google-search-advertising-google-thumbnail.jpg'),
                  const SizedBox(width: 15),
                  _socialButton(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                  const SizedBox(width: 15),
                  _socialButton(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/512px-Logo_of_Twitter.svg.png'),
                ],
              ),
              const SizedBox(height: 40),

              // 7. แก้ไขการ Navigator ไปหน้า C03
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // แก้ไขตรงนี้ให้ไปหน้า C03Ui()
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const C03Ui()));
                    },
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Color(0xFF00C853),
                        fontWeight: FontWeight.bold,
                      ),
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

  // Helper สำหรับสร้างหัวข้อช่องกรอก
  Widget _buildInputLabel(String label) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
    );
  }

  // Helper สำหรับจัดการสไตล์ของ TextField
  InputDecoration _inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      filled: true,
      fillColor: const Color(0xFFF5F5F5),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _socialButton(String imageUrl) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 55,
        width: 85,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.network(imageUrl, fit: BoxFit.contain),
      ),
    );
  }
}
