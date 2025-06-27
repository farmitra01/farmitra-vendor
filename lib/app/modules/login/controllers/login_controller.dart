import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:farmitra/app/ApiModels/post-login_request.dart';
import 'package:farmitra/app/constants/api_endpoints.dart';
import 'package:farmitra/app/constants/app_colors.dart';
import 'package:farmitra/app/services/network_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as https;

class LoginController extends GetxController {
  // Initialize controller only when needed
  final mobileNumber = TextEditingController();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Internet connection flag
  RxBool isInternetConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize connectivity subscription
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      results,
    ) {
      isInternetConnected.value = !results.contains(ConnectivityResult.none);
      if (!isInternetConnected.value) {
        showInternetErrorDialog();
      } else if (Get.isDialogOpen!) {
        Get.back();
      }
    });

    // Check initial connectivity
    checkInternetConnectivity();
  }

  Future<void> checkInternetConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    isInternetConnected.value = !result.contains(ConnectivityResult.none);
  }

  void showInternetErrorDialog() {
    if (!Get.isDialogOpen!) {
      Get.dialog(buildNetworkError(), barrierDismissible: false);
    }
  }

  String? validateMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter 10 digit mobile number';
    }
    if (value.length != 10) {
      return 'Enter valid 10 digit mobile number';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Only digits allowed';
    }
    return null;
  }
  // Api 
final ApiService _apiService = ApiService();


  // Future<void> login() async {
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization':
  //         'Bearer 475|WAbvWyKNUmtErIUOtYRJWD3HnDfRC2QgcjFRysvl065bc083',
  //   };

  //   var request = https.Request(
  //     'POST',
  //     Uri.parse('https://api.farmitra.in/api/login'),
  //   );

  //   request.body = json.encode({
  //     "email": "sattababakingup@gmail.com",
  //     "password": "uPYwDOUz",
  //   });

  //   request.headers.addAll(headers);

  //   https.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     String responseBody = await response.stream.bytesToString();
  //     print('Response Body: $responseBody');

  //     final decoded = json.decode(responseBody);

  //     // Adjust this depending on your API's actual structure
  //     String? token = decoded['token'] ?? decoded['data']?['token'];

  //     if (token != null) {
  //       await GetStorage().write('user_token', token);
  //       print("Token stored: ${GetStorage().read('user_token')}");
  //       Get.snackbar("Success", "Token saved successfully");
  //     } else {
  //       print("Token not found in response");
  //       Get.snackbar("Error", "Token not found in response");
  //     }
  //   } else {
  //     print("Login failed: ${response.reasonPhrase}");
  //     Get.snackbar("Login Failed", response.reasonPhrase ?? 'Unknown error');
  //   }
  // }
  Future<void> login() async {
    final request = PostLoginRequest(
      email: 'sattababakingup@gmail.com',
      password: 'uPYwDOUz',
    );

    final response = await _apiService.callApi(
      endpoint: ApiEndpoints.login,
      method: 'POST',
      body: request.toJson(),
    );

    if (response['success']) {
      final token = response['data']['token'] ?? response['data']['data']?['token'];
      if (token != null) {
        await GetStorage().write('user_token', token);
        print("Token stored: ${GetStorage().read('user_token')}");
        Get.snackbar("Success", "Logged in successfully");
      } else {
        print("Token not found in response");
        Get.snackbar("Error", "Token not found");
      }
    } else {
      Get.snackbar("Error", response['data']['message'] ?? 'Login failed');
    }
  }
  // New method to print stored token
  void printStoredToken() {
    final token = GetStorage().read('user_token'); // Fixed key to match login
    if (token != null) {
      debugPrint('Retrieved Token: $token');
      Get.snackbar(
        'Token',
        token,
        backgroundColor: AppColors.primaryGradinatMixColor,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
    } else {
      debugPrint('No token found in GetStorage');
      Get.snackbar(
        'Error',
        'No token found',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  void onClose() {
    _connectivitySubscription?.cancel();
    // Do NOT dispose mobileNumber here to allow reuse
    super.onClose();
  }

  // New method to clear controller
  void clearController() {
    mobileNumber.clear();
  }

  Widget buildNetworkError() {
    return AlertDialog(
      title: Column(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.error_outline, size: 50, color: AppColors.error),
          ),
          const SizedBox(height: 10),
          Text(
            'Please Check your Internet Connection',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await checkInternetConnectivity();
            if (isInternetConnected.value) {
              Get.back();
            } else {
              Get.snackbar(
                'No Internet',
                'Please enable internet and try again',
                backgroundColor: AppColors.error,
                colorText: AppColors.white,
                duration: const Duration(seconds: 3),
              );
            }
          },
          child: Text(
            'Retry',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryGradinatMixColor,
            ),
          ),
        ),
      ],
    );
  }
}