import 'package:flutter/material.dart';
import 'dart:math'; // Wajib import ini untuk fitur acak warna

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  late int _localCounter;
  bool _isInit = false;

  // Warna awal background
  Color _backgroundColor = const Color(0xFFF8F9FA);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInit) {
      final args = ModalRoute.of(context)!.settings.arguments;
      _localCounter = args != null ? args as int : 0;
      _isInit = true;
    }
  }

  // Fungsi untuk mengacak warna background
  void _changeBackgroundColor() {
    setState(() {
      // Daftar warna pastel yang enak dilihat
      final List<Color> pastelColors = [
        const Color(0xFFE3F2FD), // Biru Muda
        const Color(0xFFE8F5E9), // Hijau Muda
        const Color(0xFFFFF3E0), // Oranye Muda
        const Color(0xFFF3E5F5), // Ungu Muda
        const Color(0xFFFFEBEE), // Merah Muda
        const Color(0xFFE0F7FA), // Cyan Muda
        const Color(0xFFFFF8E1), // Kuning Muda
      ];

      // Pilih satu warna secara acak
      _backgroundColor = pastelColors[Random().nextInt(pastelColors.length)];
    });
  }

  void _increment() {
    setState(() {
      _localCounter++;
    });
    // Ganti warna setiap kali tombol ditekan
    _changeBackgroundColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar membuat warna background full sampai status bar atas
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context, _localCounter),
        ),
        title: const Text(
          "Increment Mode",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      // AnimatedContainer memberikan efek transisi warna yang halus
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500), // Durasi animasi 0.5 detik
        curve: Curves.easeInOut,
        color: _backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          // Memastikan konten berada di tengah
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_localCounter',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w100,
                  color: Colors.blueGrey.shade900,
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Tambah
              GestureDetector(
                onTap: _increment,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 45),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tap to add & change color",
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: FilledButton.tonal(
            onPressed: () => Navigator.pop(context, _localCounter),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.8),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text("Save & Return", style: TextStyle(fontSize: 18)),
          ),
        ),
      ),
    );
  }
}
