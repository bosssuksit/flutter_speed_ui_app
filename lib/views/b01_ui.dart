import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/b02_ui.dart';
// 1. เพิ่ม Import สำหรับหน้า B03 (Register)
import 'package:flutter_speed_ui_app_test/views/b03_ui.dart';

class B01Ui extends StatelessWidget {
  const B01Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.laptop_chromebook_rounded,
                      size: 150, color: Color(0xFF2346B8)),
                  const SizedBox(height: 40),
                  const Text(
                    'Discover Your\nDream Job here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2346B8)),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Explore all the existing job roles based on your interest and study major',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      // ปุ่ม Login
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const B02Ui(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2346B8),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: const Text('Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // ปุ่ม Register
                      Expanded(
                        child: TextButton(
                          // 2. แก้ไขตรงนี้: ใส่คำสั่ง Navigator.push ไปยัง B03Ui
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const B03Ui(), // ไปหน้า B03
                              ),
                            );
                          },
                          child: const Text('Register',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
