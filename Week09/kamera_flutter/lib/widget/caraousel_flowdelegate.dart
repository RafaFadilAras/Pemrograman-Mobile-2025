import 'package:flutter/material.dart';
import 'dart:math' as math;

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.scrollPosition,
    required this.filtersPerScreen,
  }) : super(repaint: scrollPosition);

  final ScrollPosition scrollPosition;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;
    final size = context.size.width;
    final itemExtent = size / filtersPerScreen;
    final active = scrollPosition.pixels / itemExtent;

    final minIndex = math.max(0, active.floor() - 3).toInt();
    final maxIndex = math.min(count - 1, active.ceil() + 3).toInt();

    for (var index = minIndex; index <= maxIndex; index++) {
      final itemXFromCenter = itemExtent * index - scrollPosition.pixels;
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();
      final itemScale = 0.5 + (percentFromCenter * 0.5);
      final opacity = 0.25 + (percentFromCenter * 0.75);

      final transform = Matrix4.identity()
        ..translate((size - itemExtent) / 2)
        ..translate(itemXFromCenter)
        ..translate(itemExtent / 2, itemExtent / 2)
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0))
        ..translate(-itemExtent / 2, -itemExtent / 2);

      context.paintChild(
        index,
        transform: transform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.scrollPosition != scrollPosition ||
        oldDelegate.filtersPerScreen != filtersPerScreen;
  }
}
