import 'dart:developer';

import 'package:assignment/core/services/home_service.dart';
import 'package:assignment/view/screens/home_screen.dart';
import 'package:assignment/view/widgets/common_widgets.dart';
import 'package:assignment/viewModel/contollers/home_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget> _screens = [HomeScreen(), HomeScreen(), HomeScreen()];
  int index = 0;
  void updateIndex(int currentIndex) {
    setState(() {
      index = currentIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          log(index.toString());
          updateIndex(index);
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(237, 2, 2, 2),

        items: [
          BottomNavigationBarItem(
            icon: BottomButtonWidget(
              0,
              index,
              Image.asset(
                height: 25,
                "assets/icons/q.png",
                color: index == 0 ? Colors.white : Colors.grey,
              ),
            ),

            label: "",
          ),
          BottomNavigationBarItem(
            icon: BottomButtonWidget(
              1,
              index,
              Image.asset(
                height: 25,
                "assets/icons/circle.png",
                color: index == 1 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: BottomButtonWidget(
              2,
              index,
              Image.asset(
                height: 30,
                "assets/icons/lambda.png",
                color: index == 2 ? Colors.white : Colors.grey,
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
