# Pemrograman Mobile - Pertemuan 13 (Persistensi Data)

**Nama : Rafa Fadil Aras**

**NIM  : 2341720007**

## Praktikum 1 - Konversi Dart model ke JSON

### Langkah-langkah praktikum 

- Langkah 1 - Buat project baru
- Langkah 2 - Buka file main.dart
  ```dart
  import 'package:flutter/material.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({super.key}); 

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter JSON Demo Rafa',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const MyHomePage(),
      );
    }
  }

  class MyHomePage extends StatefulWidget {
    const MyHomePage({super.key});

    @override
    State<MyHomePage> createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('JSON')),
        body: Container(),
      );
    }
  }
  ```
  - **Soal 1**
    - Menambahkan nama panggilan
      ```dart
      title: 'Flutter JSON Demo Rafa',
      ```
    - Mengganti warna
      ```dart
      primarySwatch: Colors.pink,
      ```
