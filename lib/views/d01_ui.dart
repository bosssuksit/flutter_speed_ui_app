import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/d02_ui.dart';
// 1. เพิ่ม Import หน้า D03
import 'package:flutter_speed_ui_app_test/views/d03_ui.dart';

class D01Ui extends StatefulWidget {
  const D01Ui({super.key});

  @override
  State<D01Ui> createState() => _D01UiState();
}

class _D01UiState extends State<D01Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1485955900006-10f4d324d411?q=80&w=1000',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://cdn-icons-png.flaticon.com/512/10061/10061834.png',
                    height: 60,
                    color: const Color(0xFF00C4CC),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Fruzzdigital',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3142),
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const D02Ui()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D2027),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // 2. อัปเดตปุ่ม Register ให้ไปหน้า D03Ui
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const D03Ui()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 55),
                      side: const BorderSide(color: Color(0xFF1D2027)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Color(0xFF1D2027), fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue as a guest',
                      style: TextStyle(
                        color: Color(0xFF00C4CC),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
