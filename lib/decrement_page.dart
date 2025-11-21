import 'package:flutter/material.dart';
import 'dart:math';

class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key});

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  late int _localCounter;
  bool _isInit = false;

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

  void _changeBackgroundColor() {
    setState(() {
      final List<Color> pastelColors = [
        const Color(0xFFFFEBEE), // Merah Muda
        const Color(0xFFFCE4EC), // Pink
        const Color(0xFFFFF3E0), // Oranye
        const Color(0xFFEFEBE9), // Coklat Muda
        const Color(0xFFECEFF1), // Abu Kebiruan
        const Color(0xFFE8EAF6), // Indigo Muda
      ];
      _backgroundColor = pastelColors[Random().nextInt(pastelColors.length)];
    });
  }

  void _decrement() {
    if (_localCounter > 0) {
      setState(() {
        _localCounter--;
      });
      _changeBackgroundColor();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black54),
          onPressed: () => Navigator.pop(context, _localCounter),
        ),
        title: const Text(
          "Decrement Mode",
          style: TextStyle(color: Colors.black54),
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: _backgroundColor,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_localCounter',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.w100,
                  color: _localCounter == 0
                      ? Colors.grey
                      : Colors.blueGrey.shade900,
                ),
              ),
              const SizedBox(height: 40),

              GestureDetector(
                onTap: _decrement,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.black87,
                    size: 45,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Tap to subtract & change color",
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
          child: FilledButton(
            onPressed: () => Navigator.pop(context, _localCounter),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.black87,
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
