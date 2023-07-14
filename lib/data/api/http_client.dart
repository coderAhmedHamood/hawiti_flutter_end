import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  static final Api _singleton = Api._internal();
  // final String _baseUrl = 'http://192.168.0.147:8000/api/';
  final String _baseUrl = 'http://192.168.0.147/hawiti_end/api/';
  // final String _baseUrl = 'https://topsoftp.com/hawiti_end/api/';
  late http.Client _client;
  late String _token='';

  factory Api() {
    return _singleton;
  }

  Api._internal() {
    _client = http.Client();
  }

  setToken(String token) {
    _token = token;
  }

  Future<dynamic> get(String path) async {
    _token=GetStorage().read('token')??"";
    final response = await _client.get(
      Uri.parse('$_baseUrl$path'),
      headers: {'Authorization': 'Bearer $_token',  "Accept": 'application/json'},
    );
    return response;
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    print('print post  in http client');

    _token= GetStorage().read('token')??"";
    print(_token);
    final response = await _client.post(
      Uri.parse('$_baseUrl$path'),
      headers: {'Authorization': 'Bearer $_token',  "Accept": 'application/json'},
      body: data,
    );
    return response;
  }
}
