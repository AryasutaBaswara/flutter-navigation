// lib/pages/halaman3.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trial/bloc/bloc_increment.dart';
import 'package:flutter_trial/event/event_increment.dart';
import 'package:flutter_trial/state/state_increment.dart';

class Halaman3 extends StatefulWidget {
  const Halaman3({super.key});

  @override
  State<Halaman3> createState() => _Halaman3State();
}

class _Halaman3State extends State<Halaman3> {
  final TextEditingController _jumlahController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc_increment, State_increment>(
      builder: (context, state) {
        // Logika untuk menampilkan angka terakhir
        int currentNumber = 0;
        if (state is State_increment_update) {
          currentNumber = state.number;
        }

        return Scaffold(
          appBar: AppBar(title: const Text("Halaman Increment")),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 1. Tampilan Angka
                  Text(
                    currentNumber.toString(),
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 2. Kolom Input
                  TextField(
                    controller: _jumlahController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Input Angka Baru",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // 3. Tombol Update (Tombol +1 sudah dihapus)
                  SizedBox(
                    width:
                        double.infinity, // Agar tombol selebar layar (opsional)
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_jumlahController.text.isNotEmpty) {
                          int angkaInput = int.parse(_jumlahController.text);

                          // Kirim event input
                          context.read<Bloc_increment>().add(
                            Event_increment_add(angkaInput),
                          );

                          // Bersihkan text field
                          _jumlahController.clear();
                          // Tutup keyboard
                          FocusScope.of(context).unfocus();
                        }
                      },
                      child: const Text(
                        "Tambah Sesuai Input",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/halaman4');
                    },
                    label: const Text("Pergi ke Halaman Decrement"),
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
