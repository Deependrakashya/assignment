import 'dart:developer';

import 'package:assignment/view/widgets/common_widgets.dart';
import 'package:assignment/viewModel/contollers/home_contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_map/flutter_map.dart' as fm;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    super.initState();

    controller.getPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
      ),
      child: Scaffold(
        body: SizedBox.expand(
          child: FlutterMap(
            options: MapOptions(
              backgroundColor: const Color.fromARGB(28, 29, 24, 1),
              initialZoom: 14,
              initialCenter: LatLng(28.6039, 77.2090),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.assignment',
                tileBuilder: darkModeTileBuilder,
              ),
              MarkerLayer(
                markers: [
                  fm.Marker(
                    point: LatLng(28.6139, 77.2090),
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      "assets/animated_icons/location loading.json",
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  fm.Marker(
                    point: LatLng(28.6100, 77.2190),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      "assets/animated_icons/LocationDotts.json",

                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  fm.Marker(
                    point: LatLng(28.6100, 77.2000),
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      "assets/animated_icons/LocationDotts.json",
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomSheet: Obx(() {
          if (controller.isLoading.value) {
            return Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.zero,
              ),
              alignment: Alignment.center,
              child: const SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              ),
            );
          } else if (controller.places.isEmpty) {
            return Container(
              height: 120,
              alignment: Alignment.center,
              color: Colors.black87,
              child: const Text(
                'No places found',
                style: TextStyle(color: Colors.white70),
              ),
            );
          } else {
            return Container(
              height: 220,
              decoration: const BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.zero,
                boxShadow: [],
              ),
              child: ListView.builder(
                itemCount: controller.places.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final date = DateTime.parse(
                    controller.places[index]!.time!,
                  ).toLocal();
                  final formattedDate = DateFormat(
                    'MMM d, yyyy • hh:mm a',
                  ).format(date);

                  return ListTile(
                    leading: LottieBuilder.asset(
                      'assets/animated_icons/location loading.json',
                    ),
                    title: Text(
                      controller.places[index].name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      formattedDate,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 107, 107, 107),
                      ),
                    ),
                    trailing: const Icon(
                      CupertinoIcons.forward,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            );
          }
        }),
      ),
    );
  }
}
