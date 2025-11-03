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

## Praktikum 2 - Menggunakan await/async untuk menghindari callbacks

### Langkah-langkah praktikum 

- Langkah 1 - Buka file main.dart
  
    ```dart
    Future<int> returnOneAsync() async {
        await Future.delayed(const Duration(seconds: 3));
        return 1;
    }

    Future<int> returnTwoAsync() async {
        await Future.delayed(const Duration(seconds: 3));
        return 2;
    }

    Future<int> returnThreeAsync() async {
        await Future.delayed(const Duration(seconds: 3));
        return 3;
    }
    ```

- Langkah 2 - Tambah method count()
  
    ```dart
    Future count() async {
        int total = 0;
        total = await returnOneAsync();
        total += await returnTwoAsync();
        total += await returnThreeAsync();
        setState(() {
            result = total.toString();
        });
    }
    ```

- Langkah 3 - Panggil count()
  
    ```dart
        count();
    ```

- Langkah 4 - Run
  - **Soal 4**
    - Jelaskan maksud kode langkah 1 dan 2
  
        Pada langkah 1, tiga method asynchronous (returnOneAsync(), returnTwoAsync(), dan returnThreeAsync()) digunakan untuk mensimulasikan proses yang memerlukan waktu, seperti mengambil data dari server atau menjalankan perhitungan yang tidak langsung selesai. Masing-masing method menggunakan Future.delayed selama tiga detik sebelum mengembalikan nilai 1, 2, atau 3.

        Pada langkah 2, method count() berfungsi untuk memanggil ketiga method tersebut secara berurutan menggunakan keyword await. Nilai yang dikembalikan dari setiap method dijumlahkan ke dalam variabel total, lalu hasilnya diubah menjadi string dan ditampilkan pada layar melalui setState().

    - Hasil

        ![soal4](img/soal/soal4.gif)

## Praktikum 3 - Menggunakan Completer di Future

### Langkah-langkah praktikum 

- Langkah 1 - Buka main.dart

    ```dart
    import 'package:async/async.dart';
    ```

- Langkah 2 - Tambahkan variabel dan method

    ```dart
    late Completer completer;

    Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
    }

    Future calculate() async {
    await Future.delayed(const Duration(seconds : 5));
    completer.complete(42);
    }
    ```

- Langkah 3 - Ganti isi kode onPressed()

    ```dart
    getNumber().then((value) {
            setState(() {
            result = value.toString();
        });
    });
    ```

- Langkah 4 - Run
  - **Soal 5**
    - Jelaskan maksud kode langkah 2

        kode program tersebut membuat proses asynchronous menggunakan Completer. Fungsi getNumber() memulai proses perhitungan dengan memanggil calculate(), lalu calculate() menunggu 5 detik sebelum mengembalikan hasil bernilai 42. Intinya, Completer digunakan agar program bisa menunggu hasil dari proses yang berlangsung secara tidak langsung (asynchronous).

    - Hasil 
  
        ![soal5](img/soal/soal5.gif)
  
