import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_client.dart';

class CartRepo extends GetxService{
  late ApiClient apiClient;
  CartRepo({required this.apiClient});
  Future<Response> addToCart({required int objectId,required int quantity,String comment="",})async{
    return await apiClient.postData("shop/carts/add?menuId=$objectId&quantity=$quantity",{
      "menuId":objectId,
      "quantity":quantity,
      "comment":comment,
    },
    );
  }


  Future<Response> addToCartUnits({required int objectId,required int quantity,String comment="",required String unitsId,required String unitsName,required int price})async{
    return await apiClient.postData("shop/carts/add",{
      "menuId":objectId,
      "quantity":quantity,
      "comment":comment,
      "units_id":unitsId,
      "units_name":unitsName,
      "price":price,
    },
    );
  }
  Future<Response> addCoupon({required String coupon})async{
    return await apiClient.postData("shop/checkout?step=coupon&coupon_code=$coupon",{

    },
    );
  }
  Future<Response> checkShipping()async{
    // var shopId2=GetStorage().read("shopId");
    print("shopIdin check chipping");
    // print(shopId2);
    return await apiClient.postData("shop/checkout",{
    "step":"shiping"
    },
      // shopId: shopId2,
    );
  }
  Future<Response> checkPay({ required int payId })async{
    // var shopId2=GetStorage().read("shopId");
    print("shopIdin check pay");
    // print(shopId2);
    return await apiClient.postData("shop/checkout",{
      "step":"pay",
      "payment_method_id":payId
    },
      // shopId: shopId,
    );
  }
  Future<Response> checkDetails({required double lat,required double lon,required String firstname,required int country,required int state, String zip="zip"})async{
    //shipping_firstname=bashar&shipping_lastname=shaeb&shipping_zip=zip&shipping_country=2&shipping_state=2
    //?step=details&?billing_lat=$lat&billing_lng=$lon&shipping_firstname=$firstname&shipping_country=$country&shipping_zip=$zip&



   return await apiClient.postData("shop/checkout",{
      "shipping_firstname":firstname,
      "shipping_lastname":firstname,
      "shipping_country":country,
      "shipping_state":state,
      "shipping_zip":zip,
      "shipping_lat":lat,
      "shipping_lng":lon,

    },
      // shopId:shopId,
    );
  }

  /// add to cart with multi units https://alnaeemonline.com/api/v1/shop/carts/add?quantity=4&menuId=1492&comment=test&units_id= 9&units_name=حبه&price=2000




  Future<Response> getCartList() async{
    //tags_type_id=$type&per_page=8&page=$page&isOpened=true"
    //&per_page=8&page=$page&isOpened=true
    return await apiClient.getData("shop/carts");
  }
  Future<Response> removeCartList() async{
    //tags_type_id=$type&per_page=8&page=$page&isOpened=true"
    //&per_page=8&page=$page&isOpened=true
    return await apiClient.deleteData("shop/carts/destroy");
  }

}