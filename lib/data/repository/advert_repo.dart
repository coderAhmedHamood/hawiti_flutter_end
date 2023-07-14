
import 'package:get/get.dart';
import '../api/api_client.dart';
class AdvertRepo extends GetxService{
  late ApiClient apiClient;
  AdvertRepo({required this.apiClient});
  Future<Response> getAdverts() async{
    return await apiClient.getData("advert/madverts");
  }


}