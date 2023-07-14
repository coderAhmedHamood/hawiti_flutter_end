import 'package:get/get.dart';
import '../api/api_client.dart';

class RegisterRepo extends GetxService{
  late ApiClient apiClient;
  RegisterRepo({required this.apiClient});
  Future<Response> newUser(
      {required String userName, required String password, required String email,required String phone ,required  String address , String lat="", String lon=""}) async{
    return await apiClient.postData("auth/register",{
      "password":password,
      "address_1":address,
      "name":userName,
      "email":email,
      "mobile":phone,
      "latitude":lat,
      "longitude":lon,
    });
  }
  Future<Response> updateAddress(
      {required String name, required String address, required String phone,required String password}) async{
    print("address __________________________________ $address");
    return await apiClient.putData("me",{
      "name": name,
      "address_1": address,
      "mobile": phone,
      "password":password,

    });
  }




  Future<Response>getUserDate() async{
    return await apiClient.getData("me");
  }

  // Future<Response> addNewDevice(
  //     {required DeviceModel device}) async{
  //   return await apiClient.postData("devices",{
  //     "name":device.name,
  //     "version":2,
  //     "platform":device.platform,
  //     "platform_version":device.platformVersion,
  //     "push_token":device.pushToken,
  //     "uuid":device.uuid,
  //     "latitude":device.latitude,
  //     "longitude":device.longitude,
  //   },
  //   );
  // }

  updateToke(String token){
    apiClient.updateHeader(token);
  }

}