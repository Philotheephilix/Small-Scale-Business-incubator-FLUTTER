import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/subpages/category.dart';

class Homepage extends StatelessWidget {
  final List<String> texts = [
    'Profile',
    'Wishlist',
    'F2',
    'F3',
  ];

  final List<Color> color = [

    const Color.fromARGB(255, 85, 236, 241),
  ];

  final List<String> collections = [
    'Catering',
    'Tailoring',
    'Pottery',
    'Handcrafted',
    'Home Decor',
    'Gifts',
    'Cleaning',
    'Home Design',
    'Tech',
    'Pet Care',
    'Wellness, Spa',
    'Others',
    // Add more collections as needed
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Warning',
              textAlign: TextAlign.center,
            ),
            content: const Text('Are you sure you want to exit?'),
            actions: [
              TextButton(
                onPressed: () => exit(0), // Kill app
                child: const Text('Yes'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(181, 243, 243, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 390,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 228, 220),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Businesses",
                    style: TextStyle(
                      color: Color.fromARGB(255, 96, 136, 134),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: collections.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryBasedList(
                                  collectionName: collections[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            height: 75,
                            width: 75,
                            child: Column(children: [Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(60)),
                            ),
                            Text(collections[index],style: const TextStyle(),softWrap: false,)],),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 137,
              margin: const EdgeInsets.only(left: 15, right: 15),
              width: double.maxFinite,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 180, 224, 217),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quick links",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 62, 125, 134),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemCount: texts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                color: color[index % color.length],
                                shape: BoxShape.circle,
                              ),
                            ),
                            Center(
                              child: Text(
                                texts[index],
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 52, 185, 174),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
