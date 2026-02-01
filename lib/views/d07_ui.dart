import 'package:flutter/material.dart';

class D07Ui extends StatelessWidget {
  const D07Ui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. ไอคอนเครื่องหมายถูกสีเขียว
                Image.network(
                  'https://cdn-icons-png.flaticon.com/512/5290/5290058.png',
                  height: 100,
                  width: 100,
                  color: const Color(0xFF34C2C1), // สีเขียวตาม Branding
                ),
                const SizedBox(height: 35),
                // 2. ข้อความ Password Changed!
                const Text(
                  'Password Changed!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E232C),
                  ),
                ),
                const SizedBox(height: 15),
                // 3. คำอธิบาย
                const Text(
                  'Your password has been changed\nsuccessfully.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF8391A1),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 40),
                // 4. ปุ่ม Back to Login
                ElevatedButton(
                  onPressed: () {
                    // ล้าง Stack ทั้งหมดแล้วกลับไปหน้าแรก (Login)
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D2027),
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
