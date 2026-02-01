import 'package:flutter/material.dart';

class E03Ui extends StatefulWidget {
  const E03Ui({super.key});

  @override
  State<E03Ui> createState() => _E03UiState();
}

class _E03UiState extends State<E03Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ส่วนหัวรูปส้ม (Copy สไตล์จาก E02 มาเพื่อให้แอปดูต่อเนื่อง)
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1557800636-894a64c1696f?q=80&w=1965'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  // หัวข้อ Register
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Create your new account',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                  const SizedBox(height: 25),

                  // ช่องกรอกข้อมูล 4 ช่องตามแบบ
                  _buildTextField('Name'),
                  const SizedBox(height: 15),
                  _buildTextField('E-mail'),
                  const SizedBox(height: 15),
                  _buildTextField('Phone'),
                  const SizedBox(height: 15),
                  _buildTextField('Password', isPassword: true),

                  const SizedBox(height: 20),
                  // ข้อความ Terms & Conditions
                  const Text(
                    'By signing up you agree to our Terms & Conditions\nand Privacy Policy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 25),

                  // ปุ่ม Sign Up สีส้ม Gradient
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
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                  const Text('OR',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                  const SizedBox(height: 20),

                  // Social Media Login Icons
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
                  const SizedBox(height: 25),
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
