import 'package:flutter/material.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

Widget BottomButtonWidget(int itemIndex, int selectedIndex, Widget child) {
  return Container(
    decoration: BoxDecoration(
      color: itemIndex == selectedIndex
          ? const Color.fromARGB(255, 255, 0, 0)
          : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
    ),
    padding: EdgeInsets.all(5),
    child: child,
  );
}
