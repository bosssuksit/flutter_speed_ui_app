import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/e02_ui.dart';

class E01Ui extends StatelessWidget {
  const E01Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. รูปผลไม้ Berry Juice (อัปเดตลิงก์ใหม่ที่ใช้งานได้)
              Image.network(
                'https://png.pngtree.com/png-clipart/20231017/original/pngtree-fresh-berry-juice-splash-on-transparent-background-png-image_13328243.png',
                height: 350,
                fit: BoxFit.contain,
                // กรณีโหลดรูปไม่ขึ้น จะแสดง Icon แทนเพื่อไม่ให้หน้าจอว่าง
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.fastfood,
                  size: 200,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 40),

              // 2. ข้อความหัวข้อ
              const Text(
                'BERRY JUICE',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Serif',
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              // 3. คำอธิบาย
              const Text(
                'A "Moments of healthy sip"\nThe best vitamin for your health',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 50),

              // 4. ปุ่ม Explore Now พร้อม Gradient สีส้ม-เหลือง
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFC529),
                        Color(0xFFF7941D),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(30), // ปรับให้มนโค้งตามแบบ
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFF7941D).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const E02Ui()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Explore Now',
                          style: TextStyle(
                            color:
                                Colors.white, // เปลี่ยนเป็นสีขาวให้อ่านง่ายขึ้น
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.arrow_forward_ios,
                            color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
