import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Learning")),
      body: Column(children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.snackbar(
            "SBF Rusho",
            "Hello, Now you are learning getX sm",
            backgroundColor: Colors.amber,
            snackPosition: .BOTTOM,
            onTap: (snap) {
              Get.snackbar("Clicked", "again pressed",backgroundColor: Colors.red,snackPosition: .TOP);
            }
            
          );
        },
      ),
    );
  }
}
