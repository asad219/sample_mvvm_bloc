import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sample_mvvm_bloc/data/exceptions/app_exceptions.dart';
import 'package:sample_mvvm_bloc/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkServicesApi implements BaseApiServices {
  //Get Request
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));
      jsonResponse = returnResponse(response);
    } on SocketException {
      // Check for internet connection
      throw NoInternetException('');
    } on TimeoutException {
      // Check for timeout
      throw FetchDataException('Timeout Exception');
    }
    return jsonResponse;
  }

  //Post Request
  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    dynamic jsonResponse;
    Map<String, String> headers = {
      'x-api-key': 'reqres-free-v1',
    };
    try {
      final response = await http
          .post(Uri.parse(url), body: data, headers: headers)
          .timeout(const Duration(seconds: 20));
      jsonResponse = returnResponse(response);
    } on SocketException {
      // Check for internet connection
      throw NoInternetException('');
    } on TimeoutException {
      // Check for timeout
      throw FetchDataException('Timeout Exception');
    }
    return jsonResponse;
  }

  //Patch Request
  @override
  Future<dynamic> patchApi(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .patch(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 20));
      jsonResponse = returnResponse(response);
    } on SocketException {
      // Check for internet connection
      throw NoInternetException('');
    } on TimeoutException {
      // Check for timeout
      throw FetchDataException('Timeout Exception');
    }
    return jsonResponse;
  }

  //Delete Request
  @override
  Future<dynamic> deleteApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .delete(Uri.parse(url))
          .timeout(const Duration(seconds: 20));
      jsonResponse = returnResponse(response);
    } catch (exception) {}
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 403:
        throw UnauthorisedException('Unauthorised request, please login again');
      case 500:
        throw FetchDataException(
            'Error occurred while communicating with server with status code: ${response.statusCode}');
      default:
        throw FetchDataException(
            'Error occurred while communicating with server with status code: ${response.statusCode}');
    }
  }
}
