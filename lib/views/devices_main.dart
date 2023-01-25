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
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
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
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                            bottom: selectedIndex == index ? 180 : 80,
                            left: selectedIndex == index ? 30 : 25,
                          ),
                          child: SizedBox(
                            height: selectedIndex == index ? 40 : 30,
                            child: Image.asset(category.image),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(
                            right: selectedIndex == index ? 30 : 25,
                          ),
                          child: Text(
                            category.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: selectedIndex == index ? 20 : 20),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Host/IP: Obsidian (192.168.1.103)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'User : ashiq@Obsidian',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: const Text(
                  'Tap to Unlock Device',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 20),
                child: const Icon(
                  Icons.fingerprint,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  final List<Color> kMixedColors = [
    Colors.black,
  ];

  final List<Category> categories = [
    Category(image: "assets/images/device.png", name: "Dell-15"),
    Category(image: "assets/images/device.png", name: "WDC-510"),
    Category(image: "assets/images/device.png", name: "HP-5680"),
    Category(image: "assets/images/device.png", name: "ASUS-2145"),
    Category(image: "assets/images/device.png", name: "Fujitsu-5"),
  ];
}

class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}
