import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.pink.shade300;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen Rafa'),
      ),
      body: Center(
        child: ElevatedButton(child: const Text('Change Color'),
        onPressed: (){
          _showColorDialog(context);
        }),
        ),
    ); 
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Colors.blue.shade300;
                Navigator.pop(context, color);
              }),
            TextButton(
              child: const Text('Green'),
              onPressed: () {
                color = Colors.green.shade300;
                Navigator.pop(context, color);
              }),
            TextButton(
              child: const Text('Red'),
              onPressed: () {
                color = Colors.red.shade300;
                Navigator.pop(context, color);
              }),
          ],
        );
      },
    );
    setState(() {});
  }
}