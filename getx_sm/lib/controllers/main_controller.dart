// lib/controllers/main_controller.dart
import 'package:get/get.dart';
import 'package:getx_sm/models/api_root_model.dart';
import 'package:getx_sm/services/api_services.dart';

class MainController extends GetxController {
  final ApiServices _apiService = ApiServices();

  // Observable variables
  var isLoading = true.obs;  // Start with loading true
  var apiRoot = ApiRootModel(
    people: '',
    planets: '',
    films: '',
    species: '',
    vehicles: '',
    starships: '',
  ).obs;
  
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadApiRoot(); // Load only API root first
  }

  Future<void> loadApiRoot() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // Load API root
      final root = await _apiService.getApiRoot();
      apiRoot.value = root;
      
      print('API Root Loaded: ${root.people}'); // Debug print

    } catch (e) {
      errorMessage.value = 'Error: $e';
      print('Error loading API: $e'); // Debug print
      Get.snackbar(
        'Error', 
        'Failed to load API data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
      print('Loading finished'); // Debug print
    }
  }

  Future<void> refreshData() async {
    await loadApiRoot();
  }
}