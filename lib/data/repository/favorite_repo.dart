
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../api/api_client.dart';
class FavoriteRepo extends GetxService{
  late ApiClient apiClient;
  FavoriteRepo({required this.apiClient});
  Future<Response> getFavorite(int page) async{
    var token=GetStorage().read("login_token");
    //shop/products?include=department&isFavorites=true
    return await apiClient.getData("shop/products?include=department&isFavorites=true&page=$page",
        // headers: {
        //   'Accept': 'application/json',
        //   'Content-Type': 'application/json',
        //   'Authorization': 'Bearer $token '
        // }

    );
  }

  Future<Response> addFavorite({required String objectType,required int objectId}) async{
    var token=GetStorage().read("login_token");
    // print("update token");
    // print(token);
    //   apiClient.updateHeader(token);
    //?object_type=$objectType&object_id=$objectId
    return await apiClient.postData("favorites/favorites/toggle?object_type=$objectType&object_id=$objectId",
      {
      "object_type":objectType,
     " object_id":objectId
    },
    //     headers: {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    //   'Authorization': 'Bearer $token '
    //
    // }
    );
  }
  // Future<Response>getUserDate() async{
  //   return await apiClient.getData("me");
  // }
  // updateToke(String token){
  //   apiClient.updateHeader(token);
  // }

}