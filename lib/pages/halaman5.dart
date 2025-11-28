// lib/pages/halaman4.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trial/bloc/bloc_increment.dart';
import 'package:flutter_trial/event/event_increment.dart';
import 'package:flutter_trial/state/state_increment.dart';

class Halaman5 extends StatefulWidget {
  const Halaman5({super.key});

  @override
  State<Halaman5> createState() => _Halaman5State();
}

class _Halaman5State extends State<Halaman5> {
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
            title: const Text("Halaman Multiplication"),
            backgroundColor: const Color.fromARGB(
              255,
              208,
              245,
              2,
            ).withOpacity(0.2),
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
                      color: Color.fromARGB(255, 208, 245, 2),
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
                        backgroundColor: const Color.fromARGB(
                          255,
                          208,
                          245,
                          2,
                        ).withOpacity(0.2),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_jumlahController.text.isNotEmpty) {
                          int angkaInput = int.parse(_jumlahController.text);
                          // Kita pakai Event yang SAMA, jadi datanya akan tersinkron
                          context.read<Bloc_increment>().add(
                            Event_increment_kali(angkaInput),
                          );
                          _jumlahController.clear();
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: const Text(
                        "Kalikan sesuai input",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/halaman3');
                    },
                    label: const Text("Kembali ke Halaman Increment"),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/halaman4');
                    },
                    label: const Text("Kembali ke Halaman Multiplication"),
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
