# Pemrograman Mobile - Pertemuan 12 (State Management dengan Streams)

**Nama : Rafa Fadil Aras**

**NIM  : 2341720007**

## Praktikum 1 - Dart Streams

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
        title: 'Stream Rafa',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
        ),
        home: const StreamHomePage(),
        );
    }
    }

    class StreamHomePage extends StatefulWidget {
    const StreamHomePage({super.key});

    @override
    State<StreamHomePage> createState() => _StreamHomePageState();
    }

    class _StreamHomePageState extends State<StreamHomePage> {
    @override
    Widget build(BuildContext context) {
        return Container();
    }
    }
  ```
  - **Soal 1**
    - Menambahkan nama panggilan 
        ```dart
        title: 'Stream Rafa',
        ```
    - Ganti warna tema aplikasi
        ```dart
        primarySwatch: Colors.lightBlue,
        ```
- Langkah 3 - Buat file baru stream.dart
  ```dart
  import 'package:flutter/material.dart';

    class ColorStream {
    
    }
  ```
- Langkah 4 - Tambah variabel colors
  ```dart
    final List<Color> _colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal
  ];
  ```
  - **Soal 2**

    Menambahkan 5 warna pada variabel colors
    ```dart
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.orangeAccent,
    Colors.lime
    ```
