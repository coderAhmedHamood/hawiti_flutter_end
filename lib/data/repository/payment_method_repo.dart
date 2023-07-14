
import 'package:get/get.dart';
import '../api/api_client.dart';
class PaymentMethodRepo extends GetxService{
  late ApiClient apiClient;
  PaymentMethodRepo({required this.apiClient});
  Future<Response> getPaymentMethod() async{
    return await apiClient.getData("orders/paymentmethods");
  }


}