import 'dart:io';
import 'package:flutter/material.dart';
import 'filter_selector.dart'; // pastikan file ini sudah ada di folder widget

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  Color _selectedFilter = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display the Picture with Filter'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Menampilkan foto hasil jepretan
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.file(File(widget.imagePath)),
                // Lapisan warna filter di atas foto
                if (_selectedFilter != Colors.transparent)
                  Container(
                    color: _selectedFilter.withOpacity(0.3),
                  ),
              ],
            ),
          ),
          // Menampilkan carousel filter di bawah foto
          FilterSelector(
            filters: const [
              Colors.transparent,
              Colors.redAccent,
              Colors.greenAccent,
              Colors.blueAccent,
              Colors.orangeAccent,
              Colors.purpleAccent,
            ],
            onFilterChanged: (color) {
              setState(() {
                _selectedFilter = color;
              });
            },
          ),
        ],
      ),
    );
  }
}
