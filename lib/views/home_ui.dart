import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/a01_ui.dart';
import 'package:flutter_speed_ui_app_test/views/b01_ui.dart';
import 'package:flutter_speed_ui_app_test/views/c01_ui.dart';
import 'package:flutter_speed_ui_app_test/views/d01_ui.dart';
import 'package:flutter_speed_ui_app_test/views/e01_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // พื้นหลังสีม่วงเข้มตามโค้ดเดิมของคุณ
      backgroundColor: const Color(0xFF32004B),
      body: Center(
        child: SingleChildScrollView(
          // เพิ่มเพื่อให้เลื่อนหน้าจอได้หากรูปและปุ่มยาวเกินไป
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 45.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- ส่วนรูปภาพโลโก้หรือรูปตกแต่งหน้า Home ---
                // ใส่ไฟล์รูปภาพที่คุณต้องการใน assets/images/
                Image.asset(
                  'assets/images/imgg2 1.png',
                  width: 180, // ปรับขนาดความกว้าง
                  fit: BoxFit.contain,
                  // ในกรณีที่รูปยังไม่มา หรือหาไม่เจอ สามารถใช้ Icon แทนชั่วคราวได้แบบนี้:
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.flutter_dash,
                    size: 100,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40), // ระยะห่างระหว่างรูปภาพกับปุ่มแรก

                // --- รายการปุ่มกดไปหน้าต่างๆ ---
                _buildMenuButton(
                  text: 'Go to A Page',
                  color: const Color(0xFFF8A2ED),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const A01UI()));
                  },
                ),
                _buildMenuButton(
                  text: 'Go to B Page',
                  color: const Color(0xFF2346B8),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const B01Ui()));
                  },
                ),
                _buildMenuButton(
                  text: 'Go to C Page',
                  color: const Color(0xFF06B23C),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const C01Ui()));
                  },
                ),
                _buildMenuButton(
                  text: 'Go to D Page',
                  color: const Color(0xFF3CC6C1),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const D01Ui()));
                  },
                ),
                _buildMenuButton(
                  text: 'Go to E Page',
                  color: const Color(0xFFF79E1B),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const E01Ui()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ฟังก์ชันสร้างปุ่มเมนู (ช่วยให้โค้ดสะอาดและแก้ไขง่าย)
  Widget _buildMenuButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation:
              5, // เพิ่มเงาเล็กน้อยเพื่อให้ปุ่มดูลอยขึ้นจากพื้นหลังสีเข้ม
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
