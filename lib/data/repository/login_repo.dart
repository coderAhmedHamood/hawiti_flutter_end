import 'package:get/get.dart';
import '../api/api_client.dart';
class LoginRepo extends GetxService{
  late ApiClient apiClient;
  LoginRepo({required this.apiClient});
  // Future<Response> addNewDevice(
  //     {required DeviceModel device}) async{
  //   return await apiClient.postData("devices",{
  //     "name":device.name,
  //     "version":device.version,
  //     "platform":device.platform,
  //     "platform_version":device.platformVersion,
  //     "push_token":device.pushToken,
  //     "uuid":device.uuid,
  //     "latitude":device.latitude,
  //     "longitude":device.longitude,
  //   },
  //   );
  // }


  Future<Response> login(
      {required String emailOrPhone, required String password, required String loginAttribute}) async{

    return await apiClient.postData("auth/login",{
      "password":password,
      "login":emailOrPhone,
      "loginAttribute":loginAttribute,
    },);
  }
  Future<Response>getUserDate() async{
    return await apiClient.getData("me");
  }
  updateToke(String token){
    apiClient.updateHeader(token);
  }

}