import 'package:get/get.dart';
import '../api/api_client.dart';

class WorkTimeRepo extends GetxService{
  late ApiClient apiClient;
  WorkTimeRepo({required this.apiClient});
  Future<Response> getWorkTimeApp() async{
    return await apiClient.getData("working/workinghours");
  }
  Future<Response> getWorkTimeDepartment({required int departmentID}) async{
    return await apiClient.getData("working/workinghours?worknable_id=$departmentID");
  }

}