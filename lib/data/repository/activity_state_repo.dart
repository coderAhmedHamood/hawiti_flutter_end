
import 'package:get/get.dart';
import '../api/api_client.dart';
class ActivityStateRepo extends GetxService{
  late ApiClient apiClient;
  ActivityStateRepo({required this.apiClient});
  Future<Response> getActivityTypesDepartments() async{
    return await apiClient.getData("tags/types/activelystats");
  }


}