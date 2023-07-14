import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_client.dart';

class DepartmentRepo extends GetxService{
  late ApiClient apiClient;
 DepartmentRepo({required this.apiClient});
  Future<Response> getDepartmentsList({required int typeID,required int page,required String token}) async{
    //tags_type_id=$type&per_page=8&page=$page&isOpened=true"
    // var stateId=await GetStorage().read("state")??0;
    //TODO get department by state id
    return await apiClient.getData("basic/departments?tags_type_id=$typeID&per_page=8&page=$page&isOpened=true&include=working_hours");
  }
  Future<Response> getFavoriteDepartmentsList({required int typeID,required int page}) async{

    return await apiClient.getData("basic/departments?tags_type_id=$typeID&per_page=8&page=$page&isFavorites=true&isOpened=true");
  }
  Future<Response> getDepartmentsListByDistance({required int typeID,required int page,required String lat,required String lon}) async{

    return await apiClient.getData("basic/departments?tags_type_id=$typeID&per_page=8&page=$page&isFavorites=true&isOpened=true&latitude=$lat&longitude=$lon&orderBy=distance&orderDirection=desc");
  }

}