
import 'package:get/get.dart';
import '../api/api_client.dart';
class OrderRepo extends GetxService{
  late ApiClient apiClient;
  OrderRepo({required this.apiClient});
  Future<Response> getOrderUser() async{
    return await apiClient.getData("orders/orders?include=department&per_page=30");
  }
  Future<Response> getOrderDelivery() async{
    return await apiClient.getData("orders/delivery");
  }


}