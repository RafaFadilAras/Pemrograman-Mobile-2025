import 'package:flutter/material.dart';
import 'dart:async';

class ColorStream {
  final List<Color> _colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.orangeAccent,
    Colors.lime,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % _colors.length;
      return _colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> controller = StreamController<int>();

  void addNumberToSink(int number) {
    controller.sink.add(number);
  }

  close() {
    controller.close();
  }

  addError() {
    controller.sink.addError('error');
  }
}