import 'dart:async';
import 'package:http/http.dart' as http;

class BaseService {
  static final BaseService _instance = BaseService.internal();
  static const String baseUrl = "https://swapi.dev/api/";

  BaseService.internal();

  factory BaseService() => _instance;

  Future<ServiceResponseModel> getRequest(String endpoint, {int timeOut = 30}) async {
    print("calling service for----");
    print("$baseUrl$endpoint");
    try {
      final response = await http
          .get(Uri.parse("$baseUrl$endpoint"))
          .timeout(Duration(seconds: timeOut));

      if (response.statusCode == 200) {
        return ServiceResponseModel(isSuccess: true, data: response.body, errorMessage: '');
      } else {
        return ServiceResponseModel(errorMessage: "Failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      return ServiceResponseModel(errorMessage: "Error occurred: $e");
    }
  }
}

class ServiceResponseModel {
  final bool isSuccess;
  final String errorMessage;
  final dynamic data;

  ServiceResponseModel({this.isSuccess = false, required this.errorMessage, this.data});
}
