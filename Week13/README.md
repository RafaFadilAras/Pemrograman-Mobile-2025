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
- Langkah 3 - Buat folder baru assets
- Langkah 4 - Buat file baru pizzalist.json
  ```dart
  [ 
    { 
      "id": 1, 
      "pizzaName": "Margherita", 
      "description": "Pizza with tomato, fresh mozzarella and basil",
      "price": 8.75, 
      "imageUrl": "images/margherita.png" 
    }, 
    { 
      "id": 2, 
      "pizzaName": "Marinara", 
      "description": "Pizza with tomato, garlic and oregano",
      "price": 7.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 3, 
      "pizzaName": "Napoli", 
      "description": "Pizza with tomato, garlic and anchovies",
      "price": 9.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 4, 
      "pizzaName": "Carciofi", 
      "description": "Pizza with tomato, fresh mozzarella and artichokes",
      "price": 8.80, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 5, 
      "pizzaName": "Bufala", 
      "description": "Pizza with tomato, buffalo mozzarella and basil",
      "price": 12.50, 
      "imageUrl": "images/marinara.png"  
    }
  ]
  ```
- Langkah 5 - Edit pubspec.yaml
  ```dart
    assets:
    - assets/
  ```
- Langkah 6 - Edit maint.dart
  ```dart
  String pizzaString = '';
  ```
- Langkah 7 - Tetap di main.dart
  ```dart
  Future readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
    .loadString('assets/pizzalist.json');
    setState(() {
      pizzaString = myString;
    });
  }
  ```
- Langkah 8 - Panggil method readJsonFile
  ```dart
  @override
  void initState() {
    super.initState();
    readJsonFile(); 
  }
  ```
- Langkah 9 - Tampilkan hasil JSON
  ```dart
  body: Text(pizzaString),
  ```
- Langkah 10 - Run
  - **Soal 2**
    - Hasil 
        ![hasilsoal2](img/soal2.png)
