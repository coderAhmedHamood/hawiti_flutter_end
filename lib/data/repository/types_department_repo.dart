import 'package:get/get.dart';
import '../api/api_client.dart';

class TypesDepartmentRepo extends GetxService{
late ApiClient apiClient;
TypesDepartmentRepo({required this.apiClient});
Future<Response> getTypesDepartmetsList() async{
  return await apiClient.getData("tags/types");
}

}