// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sm/controllers/main_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars Universe'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            // Simple API Root Display
            _buildApiSection(),
          ],
        );
      }),
    );
  }

  Widget _buildApiSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Star Wars API Endpoints',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('People: ${controller.apiRoot.value.people}'),
            Text('Planets: ${controller.apiRoot.value.planets}'),
            Text('Films: ${controller.apiRoot.value.films}'),
          ],
        ),
      ),
    );
  }
}