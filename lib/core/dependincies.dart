
import 'package:get/get.dart';
import 'package:hawiti/controllers/id_card_controller.dart';
import 'package:hawiti/view/screens/auth/email_verification_screen.dart';
import '../controllers/auth_controller.dart';
import '../controllers/birth_controller.dart';
import '../controllers/common_operatin_controller.dart';
import '../controllers/death_card_controller.dart';
import '../controllers/family_card_controller.dart';
import '../controllers/marriage_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/Product_repo.dart';
import '../data/repository/activity_state_repo.dart';
import '../data/repository/advert_repo.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/category_repo.dart';
import '../data/repository/department_repo.dart';
import '../data/repository/favorite_repo.dart';
import '../data/repository/login_repo.dart';
import '../data/repository/order_repo.dart';
import '../data/repository/payment_method_repo.dart';
import '../data/repository/register_repo.dart';
import '../data/repository/work_hours_repo.dart';


Future<void> init() async {
//api client
  Get.lazyPut(
      () => ApiClient(appBaseUrl: "https://alnaeemonline.com/api/v1/"));
// repos
//  https://alnaeemonline.com/
//  https://alnaeem.nano2soft.com
  Get.lazyPut(() => AuthController());
//   Get.lazyPut(() => DepartmentRepo(apiClient: Get.find()));
//   Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
//   Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
//   Get.lazyPut(() => CartRepo(apiClient: Get.find()));
//   Get.lazyPut(() => LoginRepo(apiClient: Get.find()));
//   Get.lazyPut(() => RegisterRepo(apiClient: Get.find()));
//   Get.lazyPut(() => FavoriteRepo(apiClient: Get.find()));
//   Get.lazyPut(() => AdvertRepo(apiClient: Get.find()));
//   Get.lazyPut(() => ActivityStateRepo(apiClient: Get.find()));
//   Get.lazyPut(() => WorkTimeRepo(apiClient: Get.find()));
//   Get.lazyPut(() => PaymentMethodRepo(apiClient: Get.find()));
//   Get.lazyPut(() => OrderRepo(apiClient: Get.find()));
// //controllers
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => CommonController(),fenix: true);
  Get.lazyPut(() => DeathController());
  Get.lazyPut(() => BirthController());
  Get.lazyPut(() => FamilyCardController());
  Get.lazyPut(() => IdCardController(),fenix: true);
  Get.lazyPut(() => MarriageController());
  Get.lazyPut(() => VerificationEmailScreen());
  // Get.lazyPut(() => DepartmentController2(departmentRepo: Get.find()));
  // Get.lazyPut(() => CategoryController2(categoryRepo: Get.find()));
  // Get.lazyPut(() => ProductController2(productRepo: Get.find()),fenix: true);
  // Get.lazyPut(() => CartController(cartRepo: Get.find()),fenix: true);
  // Get.lazyPut(() => FavoriteController(favoriteRepo: Get.find()));
  // Get.lazyPut(() => AdvertController(advertRepo: Get.find()));
  // Get.lazyPut(() => ActivityStateController(activityStateRepo: Get.find()));
  // Get.lazyPut(() => WorkTimeController(workTimeRepo: Get.find()),fenix: true);
  // Get.lazyPut(() => PaymentMethodController(paymentMethodRepo: Get.find()),fenix: true);
  // Get.lazyPut(() => OrderController(orderRepo: Get.find()),fenix: true);
}
