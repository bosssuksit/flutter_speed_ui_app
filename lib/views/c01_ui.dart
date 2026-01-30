import 'package:flutter/material.dart';
//อย่าลืมสร้างไฟล์ c02_ui.dart และ import ตรงนี้ด้วยนะครับ
//import 'package:flutter_speed_ui_app_test/views/c02_ui.dart';

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
        // แนะนำให้ใช้ pushReplacement เพื่อไม่ให้ผู้ใช้กดย้อนกลับมาหน้า Splash
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?q=80&w=1000'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.1),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    color: Color(0xFF004D40),
                  ),
                ),
                const SizedBox(height: 30),
                // เพิ่มวงกลมโหลดหมุนๆ ให้ดูว่ากำลังโหลด (Optional)
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

// สร้าง Class C02Ui รอไว้แบบง่ายๆ เพื่อไม่ให้ Code Error
class C02Ui extends StatelessWidget {
  const C02Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C02 Login Page')),
      body: const Center(child: Text('This is C02 Page')),
    );
  }
}
