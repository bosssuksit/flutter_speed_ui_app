import 'package:flutter/material.dart';
// 1. Import หน้า D06 เพื่อใช้ในปุ่ม Verify
import 'package:flutter_speed_ui_app_test/views/d06_ui.dart';

class D05Ui extends StatefulWidget {
  const D05Ui({super.key});

  @override
  State<D05Ui> createState() => _D05UiState();
}

class _D05UiState extends State<D05Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // ปุ่มย้อนกลับ
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 20),
                ),
              ),
              const SizedBox(height: 35),
              // หัวข้อ OTP Verification
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E232C),
                ),
              ),
              const SizedBox(height: 15),
              // คำอธิบาย
              const Text(
                'Enter the verification code we just sent on your email address.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF8391A1),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 40),

              // --- ช่องกรอก OTP 4 ช่อง ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _otpTextField(),
                  _otpTextField(),
                  _otpTextField(),
                  _otpTextField(),
                ],
              ),

              const SizedBox(height: 40),
              // 2. ปุ่ม Verify เชื่อมต่อไปหน้า D06
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const D06Ui()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D2027),
                  minimumSize: const Size(double.infinity, 55),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget สำหรับช่องกรอกตัวเลข OTP แต่ละช่อง
  Widget _otpTextField() {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextField(
        onChanged: (value) {
          // กระโดดไปช่องถัดไปอัตโนมัติเมื่อพิมพ์เลข 1 ตัว
          if (value.length == 1) FocusScope.of(context).nextFocus();
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: const Color(0xFFF7F8F9),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF34C2C1)),
          ),
        ),
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
