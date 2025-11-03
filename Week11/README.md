# Pemrograman Mobile - Pertemuan 11 (Pemrograman Asynchronous)

**Nama : Rafa Fadil Aras**

**NIM  : 2341720007**

## Praktikum 1 - Mengunduh Data dari Web Service (API)

### Langkah-langkah praktikum 

- Langkah 1 - Buat project baru
  
    ![langkah1](img/prak1/langkah1.png)

- Langkah 2 - Cek file pubspec.yaml

    ![langkah2](img/prak1/langkah2.png)

- Langkah 3 - Buka file main.dart
  
    ```dart
        import 'dart:async';
        import 'package:flutter/material.dart';
        import 'package:http/http.dart';
        import 'package:http/http.dart' as http;

        void main() {
        runApp(const MyApp());
        }

        class MyApp extends StatelessWidget {
        const MyApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Rafa',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: const FuturePage(),
            );
        }
        }

        class FuturePage extends StatefulWidget {
        const FuturePage({super.key});

        @override
        State<FuturePage> createState() => _FuturePageState();
        }

        class _FuturePageState extends State<FuturePage> {
        String result = '';

        @override
        Widget build(BuildContext context) {
            return Scaffold(
            appBar: AppBar(
                title: const Text('Back from the Future'),
            ),
            body: Center(
                child: Column(
                children: [
                    const Spacer(),
                    ElevatedButton(
                    child: const Text('GO!'),
                    onPressed: () {},
                    ),
                    const Spacer(),
                    Text(result),
                    const Spacer(),
                    const CircularProgressIndicator(),
                    const Spacer(),
                ],
                ),
            ),
            );
        }
        }
    ```

  - **Soal 1** 
  
    Menambahkan nama panggilan pada title app

    ```dart
    title: 'Rafa',
    ```

- Langkah 4 - Tambah method getData()
  
    ```dart
      Future<Response> getData() async {
        const authority = 'www.googleapis.com';
        const path = '/books/v1/volumes/junbDwAAQBAJ';
        Uri url = Uri.https(authority, path);
        return http.get(url);
      }
    ```

  - **Soal 2**
    - Mencari judul buku favorit, lalu mengganti ID buku pada variabel path kode tersebut. 
    - Mencoba mengakses di browser URI 
  
        ![soal2](img/soal/soal2.png)
  
- Langkah 5 - Tambah kode di ElevatedButton
  ```dart
    const Spacer(),
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                setState(() {});
                getData()
                    .then((value) {
                      result = value.body.toString().substring(0, 450);
                      setState(() {});
                    })
                    .catchError((_) {
                      result = 'An error occurred';
                      setState(() {});
                    });
              },
            ),
    ```

  - **Soal 3**
    - Jelaskan maksud kode langkah 5 terkait substring dan catchError

        Kode substring(0,450) digunakan untuk membatasi jumlah karakter dari data yang ditampilkan. saat tombol "GO!" di klik, aplikasi mengambil data dari API Google Books. Kode catchError berfungsi untuk menangani kemungkinan kesalahan saat pengambilan data, seperti koneksi internet yang bermasalah atau URL tidak valid. Jika error, aplikasi tidak akan berhenti tiba-tiba, tetapi akan menampilkan pesan "An error occurred" di layar untuk memberi tahu pengguna. 

    - Hasil

        ![soal3](img/soal/soal3.gif)

