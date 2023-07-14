import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_client.dart';

class CategoryRepo extends GetxService{
  late ApiClient apiClient;
  CategoryRepo({required this.apiClient});
  Future<Response> getCategoriesListByDepartment({required int departmentId, int page=1}) async{
    var token=GetStorage().read("login_token");
    //tags_type_id=$type&per_page=8&page=$page&isOpened=true"
    //&per_page=8&page=$page&isOpened=true
    return await apiClient.getData("tags/categories?per_page=100&departments_id=$departmentId");
  }

}