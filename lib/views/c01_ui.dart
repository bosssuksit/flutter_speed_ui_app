import 'package:flutter/material.dart';
// 1. นำ Comment ออกเพื่อให้รู้จักหน้า C02 (ตรวจสอบชื่อ path ให้ถูกต้องตามโปรเจกต์ของคุณ)
import 'package:flutter_speed_ui_app_test/views/c02_ui.dart';

class C01Ui extends StatefulWidget {
  const C01Ui({super.key});

  @override
  State<C01Ui> createState() => _C01UiState();
}

class _C01UiState extends State<C01Ui> {
  @override
  void initState() {
    super.initState();
    // หน่วงเวลา 3 วินาทีแล้วเด้งไปหน้า C02
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        // ใช้ pushReplacement เพื่อไม่ให้กดย้อนกลับมาหน้า Splash
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const C02Ui()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // พื้นหลังรูปภาพจาก Network
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?q=80&w=1000'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay สีดำจางๆ เพื่อให้ข้อความอ่านง่ายขึ้น
          Container(
            color: Colors.black.withOpacity(0.2),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // โลโก้ตัว H
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'H',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00C853),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'HOPE FOR\nHUMANITY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 100),
                const Text(
                  'Welcome to\nhope for humanity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white, // ปรับเป็นสีขาวเพื่อให้เห็นชัดบนรูปพื้นหลัง
                  ),
                ),
                const SizedBox(height: 30),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// *** ลบ class C02Ui เดิมที่อยู่ท้ายไฟล์นี้ออก เพราะเราจะใช้ไฟล์แยกกัน ***
