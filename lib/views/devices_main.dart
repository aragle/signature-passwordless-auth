import 'package:flutter/material.dart';
import 'package:scaled_list/scaled_list.dart';

class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  // List<String> images = ['assets/images/signature.png'];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 150),
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Center(
          child: ScaledList(
            itemCount: categories.length,
            itemColor: (index) {
              return kMixedColors[index % kMixedColors.length];
            },
            itemBuilder: (index, selectedIndex) {
              final category = categories[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: selectedIndex == index ? 40 : 40,
                    child: Image.asset(category.image),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    category.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: selectedIndex == index ? 20 : 20),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  final List<Color> kMixedColors = [
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(255, 0, 0, 0),
    Color.fromARGB(255, 0, 0, 0),
  ];

  final List<Category> categories = [
    Category(image: "assets/images/signature.png", name: "Dell-110"),
    Category(image: "assets/images/signature.png", name: "WDC-510"),
    Category(image: "assets/images/signature.png", name: "HP-5680"),
    Category(image: "assets/images/signature.png", name: "ASUS-2145"),
    Category(image: "assets/images/signature.png", name: "Fujitsu-5"),
  ];
}

class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}
