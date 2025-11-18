import 'package:flutter/material.dart';
import 'dart:convert';
import './model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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
        primarySwatch: Colors.blue,
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
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  int appCounter = 0;

  String documentsPath='';
  String tempPath='';

  late File myFile;
  String fileText='';

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('JSON')),
  //     body: ListView.builder(
  //       itemCount: myPizzas.length,
  //       itemBuilder: (context, index) {
  //         return ListTile(
  //           title: Text(myPizzas[index].pizzaName),
  //           subtitle: Text(myPizzas[index].description),
  //         );
  //       },
  //     ),
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text('JSON')),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           Text(
  //             'You have opened this app $appCounter times.',
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               deletePreference();
  //             },
  //             child: const Text('Reset Counter'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path Provider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Doc path' + documentsPath),
          Text('Temp path' + tempPath),

          ElevatedButton(
            onPressed: () {
              readFile();
            },
            child: const Text('Read File'),
          ),

          Text(fileText),
        ],
      ),
    );
  }

  // Future readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(context)
  //   .loadString('assets/pizzalist.json');
  //   setState(() {
  //     pizzaString = myString;
  //   });
  // }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
    .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> pizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      pizzas.add(myPizza);
    }

    String json = convertToJSON(pizzas);
    print(json);
    return pizzas;    
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
      setState(() {
        documentsPath = docDir.path;
        tempPath = tempDir.path;
      });
    return docDir;
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Rafa Fadil Aras, 2341720007');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  // @override
  // void initState() {
  //   super.initState();
  //     getPaths();
  //     readAndWritePreference();
  //     readJsonFile().then((value) {
  //       setState(() {
  //         myPizzas = value;
  //       });
  //     }); 
  // }

  @override
  void initState() {
    super.initState();
    initFile();
  }

  Future<void> initFile() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();

    setState(() {
      documentsPath = docDir.path;
      tempPath = tempDir.path;
    });

    myFile = File('${docDir.path}/pizzas.txt');
    await writeFile();
  }
}
