import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/constant/localStorageVariable.dart';
class ApiClient extends GetConnect  implements GetxService{
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 5);
    token = GetStorage().read(LocalStorage.TOKEN)??"";

    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  void updateHeader(String token) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }
  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, String? contentType,
        Map<String, String>? headers, Function(dynamic)? decoder,
      }) async {
    try {
      token = GetStorage().read(LocalStorage.TOKEN)??"";
      updateHeader(token);
      // print("token in header$token");
      Response response = await get(
        uri,
        contentType: contentType,
        query: query,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token', //carrier
        },
        decoder: decoder,

      );
      response = handleResponse(response);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> postData(String uri, dynamic body,{String shopId=""} ) async {
    try {
      token = GetStorage().read(LocalStorage.TOKEN)??"";
      print("shopid2 in api client");
    // ;
      var shopId2=  GetStorage().read("shopId")??"";
      print(shopId2);
      updateHeader(token);
      Response response = await post(
        uri, body,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token ',
           "X-SHOP-ID":"$shopId2",
        },

      );
      response = handleResponse(response);
      // if(Foundation.kDebugMode) {
      //   log('====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      // }
      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  Future<Response> putData(String uri, dynamic body ) async {
    try {
      token = GetStorage().read(LocalStorage.TOKEN)??"";
      updateHeader(token);
      Response response = await put(
        uri, body,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token ',
        },
      );
      response = handleResponse(response);
      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(String uri ) async {
    try {
      token = GetStorage().read(LocalStorage.TOKEN)??"";
      updateHeader(token);
      Response response = await delete(
        uri,
        headers: {
          // 'Content-Type': 'application/json; charset=UTF-8',
          // 'Authorization': 'Bearer $token', //carrier
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token '
        },
      );
      response = handleResponse(response);

      return response;
    }catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }



  Response handleResponse(Response response) {
    Response _response = response;
    if(_response.hasError && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: "Error");

      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);

      }
    }else if(_response.hasError && _response.body == null) {
      _response = const Response(statusCode: 0, statusText: 'Connection to API server failed due to internet connection');
    }
    return _response;
  }

}