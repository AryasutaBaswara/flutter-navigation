import 'package:flutter_bloc/flutter_bloc.dart';
// Sesuaikan nama package di bawah ini dengan nama project kamu
import 'package:flutter_trial/event/event_increment.dart';
import 'package:flutter_trial/state/state_increment.dart';

class Bloc_increment extends Bloc<Event_increment, State_increment> {
  int number = 0;

  // --- PERHATIKAN BAGIAN INI ---
  Bloc_increment() : super(State_increment_initial()) {
    // Handler lama (tombol +1)
    on<Event_increment_add>(onAddNumber); // Handler Tambah
    on<Event_increment_subtract>(onSubtractNumber); // Handler Kurang
    on<Event_increment_kali>(onKaliNumber);
  }
  // -----------------------------
  void onAddNumber(Event_increment_add event, Emitter<State_increment> emit) {
    number += event.angkaTambahan;
    emit(State_increment_update(number));
  }

  // Logika Halaman 4 (Kurang)
  void onSubtractNumber(
    Event_increment_subtract event,
    Emitter<State_increment> emit,
  ) {
    number -= event.angkaPengurang; // Logika pengurangan
    emit(State_increment_update(number));
  }

  // Logika Halaman 5 (Kali)
  void onKaliNumber(Event_increment_kali event, Emitter<State_increment> emit) {
    number *= event.multiplier;
    emit(State_increment_update(number));
  }
}
