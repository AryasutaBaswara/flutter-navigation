abstract class Event_increment {}

class Event_increment_tambahNumber extends Event_increment {}

class Event_increment_input extends Event_increment {
  final int inputAngka; // Variabel untuk menampung angka dari user
  Event_increment_input(this.inputAngka);
}

class Event_increment_add extends Event_increment {
  final int angkaTambahan;
  Event_increment_add(this.angkaTambahan);
}

class Event_increment_subtract extends Event_increment {
  final int angkaPengurang;
  Event_increment_subtract(this.angkaPengurang);
}

class Event_increment_kali extends Event_increment {
  final int multiplier; // Angka pengali
  Event_increment_kali(this.multiplier);
}
