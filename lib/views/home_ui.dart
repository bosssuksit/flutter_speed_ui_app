import 'package:flutter/material.dart';
import 'package:flutter_speed_ui_app_test/views/a01_ui.dart';
import 'package:flutter_speed_ui_app_test/views/b01_ui.dart';
// 1. เพิ่ม Import สำหรับหน้า C01 ตรงนี้
import 'package:flutter_speed_ui_app_test/views/c01_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32004B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuButton(
                text: 'Go to A Page',
                color: const Color(0xFFF8A2ED),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const A01UI()),
                  );
                },
              ),
              _buildMenuButton(
                text: 'Go to B Page',
                color: const Color(0xFF2346B8),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const B01Ui()),
                  );
                },
              ),
              // 2. แก้ไขส่วนของปุ่ม Go to C Page ตรงนี้
              _buildMenuButton(
                text: 'Go to C Page',
                color: const Color(0xFF06B23C),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const C01Ui()),
                  );
                },
              ),
              _buildMenuButton(
                text: 'Go to D Page',
                color: const Color(0xFF3CC6C1),
                onPressed: () {
                  // ใส่ Navigator สำหรับหน้า D ในอนาคต
                },
              ),
              _buildMenuButton(
                text: 'Go to E Page',
                color: const Color(0xFFF79E1B),
                onPressed: () {
                  // ใส่ Navigator สำหรับหน้า E ในอนาคต
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
