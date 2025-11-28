// lib/pages/halaman4.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trial/bloc/bloc_increment.dart';
import 'package:flutter_trial/event/event_increment.dart';
import 'package:flutter_trial/state/state_increment.dart';

class Halaman4 extends StatefulWidget {
  const Halaman4({super.key});

  @override
  State<Halaman4> createState() => _Halaman4State();
}

class _Halaman4State extends State<Halaman4> {
  final TextEditingController _jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc_increment, State_increment>(
      builder: (context, state) {
        int currentNumber = 0;
        if (state is State_increment_update) {
          currentNumber = state.number;
        }

        return Scaffold(
          // Ganti warna jadi merah agar terasa bedanya
          appBar: AppBar(
            title: const Text("Halaman Decrement"),
            backgroundColor: Colors.redAccent.withOpacity(0.2),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentNumber.toString(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 30),

                  TextField(
                    controller: _jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Input Angka Baru",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_jumlahController.text.isNotEmpty) {
                          int angkaInput = int.parse(_jumlahController.text);
                          // Kita pakai Event yang SAMA, jadi datanya akan tersinkron
                          context.read<Bloc_increment>().add(
                            Event_increment_subtract(angkaInput),
                          );
                          _jumlahController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: const Text(
                        "Kurangi Sesuai Input",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/halaman3');
                    },
                    label: const Text("Pergi ke Halaman Increment"),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/halaman5');
                    },
                    label: const Text("Pergi ke Halaman Multiplication"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
