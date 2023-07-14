import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../shared/constant/urls.dart';
import '../api/api_client.dart';

class ProductRepo extends GetxService{
  late ApiClient apiClient;
  ProductRepo({required this.apiClient});
  Future<Response> getProductsListByDepartmentId({required int departmentId,required int page}) async{
    var token=GetStorage().read("login_token")??"";
    return await apiClient.getData("shop/products?page=$page&per_page=10&departments_id=$departmentId&exclude=short_description,description,users_manual,indication,meta_title,meta_description,keywords,groups_products_id,emblem,composition,published_at,unpublished_at,manage_stock,properties,links,other_data,config_data,emblem,short_description,description,users_manual,composition,indication,meta_title,is_downloadable,is_parleying,shop_stock,is_default,is_purchased,files,is_effective,is_published,is_sold,is_purchased,is_composite,is_active,min_qty_in_stock,max_qty_in_stock");
  }



  Future<Response> getProductsList({required int departmentId,required int categoryId,required int page}) async{
    return await apiClient.getData("shop/products?categorysId=$categoryId&page=$page&per_page=8&departments_id=$departmentId&exclude=short_description,description,users_manual,indication,meta_title,meta_description,keywords,groups_products_id,emblem,composition,published_at,unpublished_at,manage_stock,properties,links,other_data,config_data,emblem,short_description,description,users_manual,composition,indication,meta_title,is_downloadable,is_parleying,shop_stock,is_default,is_purchased,files,is_effective,is_published,is_sold,is_purchased,is_composite,is_active,min_qty_in_stock,max_qty_in_stock");
  }

  Future<Response> getAllProductsList({required int departmentId,required int page}) async{
    return await apiClient.getData("shop/products?page=$page&per_page=30&departments_id=$departmentId");
  }
  Future<Response> getAllProductsList2({required int departmentId,required int page}) async{
    return await apiClient.getData("shop/products?page=$page&per_page=30&departments_id=$departmentId");
  }

  Future<Response> getFavoriteProductsList({required int departmentId,required int categoryId,required int page}) async{

    return await apiClient.getData("shop/products?categorysId=$categoryId&page=$page&per_page=6&departments_id=$departmentId");
  }

}