import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import BLoC dan Halaman3 saja
import 'package:flutter_trial/bloc/bloc_increment.dart';
import 'package:flutter_trial/pages/halaman3.dart';
import 'package:flutter_trial/pages/halaman4.dart';
import 'package:flutter_trial/pages/halaman5.dart';

void main() {
  // Membuat status bar transparan (tetap dipertahankan)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Mendaftarkan BLoC
        BlocProvider<Bloc_increment>(create: (context) => Bloc_increment()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Modern Counter',
        // Tema kustom kamu tetap dipertahankan
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF8F9FA),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueGrey,
            brightness: Brightness.light,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.black87),
          ),
        ),
        // Langsung set home ke Halaman3
        home: const Halaman3(),

        routes: {
          '/halaman3': (context) => const Halaman3(),
          '/halaman4': (context) => const Halaman4(),
          '/halaman5': (context) => const Halaman5(),
        },
      ),
    );
  }
}
