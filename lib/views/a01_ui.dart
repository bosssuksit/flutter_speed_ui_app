import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/a02_ui.dart';

class A01UI extends StatelessWidget {
  const A01UI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // --- ส่วนปุ่มกดย้อนกลับ ---
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),

            // --- ส่วนบน: การ์ดสีชมพูพร้อมรูปภาพ Saly-1.png ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: const Color(0xFFF8A2ED),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/Saly-1.png', // ตรวจสอบชื่อไฟล์และโฟลเดอร์ให้ถูกต้อง
                  width: 300, // ปรับขนาดรูปภาพตามความเหมาะสม
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // --- ส่วนกลาง: หัวข้อและรายละเอียด ---
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Discover Your\nOwn Dream House',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam maecenas mi non sed ut odio.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // --- ส่วนล่าง: ปุ่ม Sign In และ Register ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const A02UI(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF8A2ED),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation:
                              0, // เอาเงาออกเพื่อให้ดูแบนราบเข้ากับดีไซน์
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // ฟังก์ชันสำหรับ Register
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xFF555555),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
