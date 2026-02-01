import 'package:flutter/material.dart';

class C03Ui extends StatefulWidget {
  const C03Ui({super.key});

  @override
  State<C03Ui> createState() => _C03UiState();
}

class _C03UiState extends State<C03Ui> {
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
                  const SizedBox(height: 60),

                  // โลโก้ H สีเขียว
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
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00C853),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Create an account so you can explore all the existing jobs',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 30),

                  _buildTextField(label: 'Email', hint: 'Email'),
                  const SizedBox(height: 20),

                  _buildTextField(
                      label: 'Password', hint: 'Password', isPassword: true),
                  const SizedBox(height: 20),

                  _buildTextField(
                      label: 'Confirm Password',
                      hint: 'Confirm Password',
                      isPassword: true),
                  const SizedBox(height: 40),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00C853),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Already have an account',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Or continue with',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 20),

                  // ส่วนของ Social Buttons ที่แก้ไขรูปภาพแล้ว
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png'),
                      const SizedBox(width: 15),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_2023.png/600px-Facebook_Logo_2023.png'),
                      const SizedBox(width: 15),
                      _socialButton(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/X_logo_2023.svg/1200px-X_logo_2023.svg.png'),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),

            // ปุ่มย้อนกลับ
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildTextField(
      {required String label, required String hint, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _socialButton(String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 55,
      width: 85,
      decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        // จัดการกรณีรูปโหลดช้าหรือโหลดไม่ได้
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, color: Colors.grey),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  strokeWidth: 2, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
