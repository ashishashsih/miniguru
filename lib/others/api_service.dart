import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mini_guru/app/modules/model/HomeModel.dart';
import 'package:mini_guru/others/NameIdModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService
{

  static final String BASE_URL = "https://raddiwala.developerzone.in/";

  static final String SIGNUP_MOBILE = BASE_URL+"getSignupMobile";
  static final String SIGNUP_EMAIL = BASE_URL+"getSignupMobile";
  static final String verifyOtpu = BASE_URL+"verifyOtp";
  static final String reSendOtpu=BASE_URL+"resendOtp";
  static final String allProducts=BASE_URL+"products";
  static final String productDetail="BASE_URL+productById";
  static final String UPLOAD_IMAGE=BASE_URL+"profileImage";

  static final String UPDATE_PROFILE = BASE_URL+"updateProfile";
  static final String GET_PROFILE = BASE_URL+"getProfile";
  static final String GET_HOME_DATA = BASE_URL+"getHomeData";

  static final String CREATE_PROJECT=BASE_URL+"createProject";
  static final String UPDATE_PROJECT=BASE_URL+"updateProject";
  static final String TOOLS_USED=BASE_URL+"toolUsed";
  static final String UPDATE_PROJECT_PROGRESS=BASE_URL+"updateProjectProgress";
  static final String MY_PROJECT_LIST=BASE_URL+"myProjectList";
  static final String WALLET_TRANSACTION=BASE_URL+"getWalletTransaction";

  static final String GET_PRODUCT_CATEGORY=BASE_URL+"getProductCategory";

  // static final String GET_PRICE_LIST=BASE_URL+"displaySubCategory";
  // static final String ADD_ADDRESS=BASE_URL+"addAddress";
  // static final String GET_ORDER_LIST=BASE_URL+"displayOrders";
  // static final String GET_ORDER_DETAIL_LIST=BASE_URL+"displayOrderDetail";
  // static final String GET_ADDRESS_LIST=BASE_URL+"displayAddress";
  // static final String ADD_ADDRESS=BASE_URL+"addAddress";
  // static final String CART=BASE_URL+"cart";
  // static final String CHECK_VERSION=BASE_URL+"checkVersion";

  //CartController cartController=Get.put(CartController());
  Future mobileRegistration(String mobile) async
  {
    print(SIGNUP_MOBILE);
    print(json.encode({"mobile": '$mobile'}));
    final response = await http.post(Uri.parse(SIGNUP_MOBILE),
        // headers: {HttpHeaders.acceptHeader: "application/json"},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"mobile": '$mobile'}));
    print("Body is here"+response.body);
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  Future emailRegistration(String email) async
  {
    print(SIGNUP_EMAIL);
    print(json.encode({"email": '$email'}));
    final response = await http.post(Uri.parse(SIGNUP_EMAIL),
        // headers: {HttpHeaders.acceptHeader: "application/json"},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"email": '$email'}));
    print("Body is here"+response.body);
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  } // SendOtp

  // Future addAddress(String address_type, String address,String city) async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getString("userId");
  //   final response = await http.post(Uri.parse(ADD_ADDRESS),
  //       //headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         // "mobile": '$mobile',
  //         // "token": '$token'
  //         "userId":'$userId',
  //         "type":'$address_type',
  //         "address":'$address',
  //         "cityId":'$city',
  //       }));
  //   print(json.encode({
  //     // "mobile": '$mobile',
  //     // "token": '$token'
  //     "userId":'$userId',
  //     "type":'$address_type',
  //     "address":'$address',
  //     "cityId":'$city',
  //   }));
  //
  //   var ConvertDataToJson = jsonDecode(response.body);
  //   return ConvertDataToJson;
  // }

  // Future getVersionUpdate(String versionCode,String versionName) async
  // {
  //   print(CHECK_VERSION);
  //   print(json.encode({"versionCode":versionCode,"versionName":versionName,}));
  //   final response = await http.post(Uri.parse(CHECK_VERSION),
  //       //headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         "versionCode":versionCode,
  //         "versionName":versionName,
  //       })
  //   );
  //   print("Response From Version Server:${response.body}");
  //   var status=json.decode(response.body)['status'];
  //   print("Response From Version After Proc:${status}");
  //   return status;
  //   // var ConvertDataToJson = jsonDecode(response.body);
  //   // return ConvertDataToJson;
  // }

  // Future placeOrder(String items,String addressId,String date,String time) async
  // {
  //   String jsonItems = jsonEncode(cartController.FinalcartList);
  //   print(jsonItems);
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getString("userId");
  //   var userMobile=prefs.getString("userId");
  //   final response = await http.post(Uri.parse(CART),
  //       //headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         "userId":'$userId',
  //         "items":cartController.FinalcartList,
  //         "addressId":'$addressId',
  //         "date":'$date',
  //         "time":'$time',
  //       }));
  //   print(json.encode({
  //     "userId":'$userId',
  //     "items":cartController.FinalcartList,
  //     "addressId":'$addressId',
  //     "date":'$date',
  //     "time":'$time',
  //   })
  //   );
  //
  //   var ConvertDataToJson = jsonDecode(response.body);
  //   return ConvertDataToJson;
  // }

  // Future uploadImage(String image) async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getInt("userid");
  //   final response = await http.post(Uri.parse(UPLOAD_IMAGE),
  //       //headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         "token":'4****',
  //         "image":'$image',
  //         "userId":'$userId'
  //       }));
  //   print(json.encode({
  //     "token":'4****',
  //     "userId":'$userId',
  //     "image":'$image'
  //   }));
  //
  //   var ConvertDataToJson = jsonDecode(response.body);
  //   return ConvertDataToJson;
  // }
//   Future resendOtp(String userId) async
//   {
//     final response = await http.post(Uri.parse(reSendOtpu),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode(
//             {
//               "userId": '$userId',
//             }));
//     print(reSendOtpu);
//     print(json.encode({
//       "userId": '$userId',
//     }));
//     print(response);
//     print(response.body);
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   } // reSendOtp

  // Future verifyOtp(String mobile, String otp,String userId) async
  // {
  //   print(verifyOtpu);
  //   print(json.encode({
  //     "mobile": '$mobile',
  //     "userId": '$userId',
  //     "otp": '$otp',
  //   }));
  //   final response = await http.post(Uri.parse(verifyOtpu),
  //       // headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         "mobile": '$mobile',
  //         "userId": '$userId',
  //         "otp": '$otp',
  //       }));
  //   var ConvertDataToJson = jsonDecode(response.body);
  //   return ConvertDataToJson;
  // }
//
//   //showBanners
//   Future showBanners() async {
//     final response = await http.post(Uri.parse(BASE_URL + Banners),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '4****',
//           "banner_type": 'main_banner',
//
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //Women Omark
//   Future allProducts(String token) async {
//     final response = await http.post(Uri.parse(BASE_URL + AllProducts),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //Product
  Future getPproductDetails(int productid) async
  {
    // final response = await http.post(Uri.parse(BASE_URL + productDetail),
    //     headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
    //     body: json.encode({"Id": '$productid'}));
    // var ConvertDataToJson = jsonDecode(response.body);
    // return ConvertDataToJson;
    var convertDataToJson = '{"id":1,"categoryId":1,"name":"Glue Gun","price":205,"description":"it is demo description is there and this will be dynamic with the help of the your server data when live api will running.","image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg","status":true}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

//   static Future singleProductDetails(String productid) async
//   {
//     String token="4****";
//     final response = await http.post(Uri.parse(BASE_URL + ProductDetails),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "Id": '$productid',
//
//         }));
//     print(response.body);
//     // var ConvertDataToJson = jsonDecode(response.body);
//     // var tag = json.decode(ConvertDataToJson)['product']; //['data'];
//     // print(tag);
//     Map<String, dynamic> map = json.decode(response.body);
//     List<dynamic> dta = [];
//     dta = map["product"];
//     return productDetailFromJson(json.encode(dta));
//   }
//   // Cart Count
//   Future cartcount(String token, int userId) async {
//     print(
//         json.encode({
//           "token": '$token',
//           "userId": '$userId',
//           "type":"cart",
//         })
//     );
//     final response = await http.post(Uri.parse(BASE_URL +CartCount),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//
//           "userId": '$userId',
//           "type":'cart',
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //Cart Count
//   Future cartSummary(String token, int userId) async {
//     print(json.encode({
//       "token": '$token',
//       "userId": '$userId',
//       "type":"cartsum",
//     }));
//     final response = await http.post(Uri.parse(BASE_URL +CartSummary),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "userId": '$userId',
//           "type":"cartsum",
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //end of Product Details
//   Future homeStore(String token,String type) async {
//     final response = await http.post(Uri.parse(BASE_URL + HomeStore),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "type": '$type',
//
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //Add To Cart
//   Future addToBagApi(String token, int userId, int productId,int colorId,int sizeId) async {
//     final response = await http.post(Uri.parse(BASE_URL + Cart),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "quantity":1,
//           "userId": '$userId',
//           "productId": '$productId',
//           "colorId": '$colorId',
//           "sizeId": '$sizeId',
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//
//   //DISPLAY BAG API
//   Future displayBag(String token, int userId, String type) async {
//     final response = await http.post(Uri.parse(BASE_URL + DisplayCart),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//
//           "userId": '$userId',
//           "type":"$type",
//         }));
//
//     print(response.body);
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   Future removeCartItem(String token, int userId,int cartkey) async {
//     final response = await http.post(Uri.parse(BASE_URL + RemoveItem),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//
//           "userId": '$userId',
//           "key":"$cartkey",
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//
//   static Future getGymList() async {
//     // final response = await http.post(Uri.parse(BASE_URL + GET_STUDENT_LIST),
//     //     headers: {HttpHeaders.acceptHeader: "application/json"},
//     //     body: json.encode({"userid": '$userid'}));
//     print(GET_GYM_LIST);
//     final response=await http.get(Uri.parse(GET_GYM_LIST),headers: {HttpHeaders.acceptHeader: "application/json"},);
//     if(response.statusCode==200)
//     {
//       print(response.body);
//       //var convertDataToJson = response.body;
//       var status=json.decode(response.body)['status'];
//       if(status)
//       {
//         var tag = json.decode(response.body)['data'];//['data'];
//         print(tag);
//         Map<String, dynamic> map = json.decode(response.body);
//         List<dynamic> dta=[];
//         dta = map["data"];
//         return gymFromJson(json.encode(tag));
//       }
//     }else
//     {
//       return gymFromJson(json.encode([]));
//     }
//   }
//
//   static Future getPlanList(String gymId,String planTypeId) async
//   {
//     final response = await http.post(Uri.parse(GET_PLAN_LIST),
//         headers: {HttpHeaders.acceptHeader: "application/json"},
//         body: json.encode({"gymId": '$gymId',"planTypeId": '$planTypeId'}));
//     // print(GET_GYM_LIST);
//     //var response = '{"status":true,"msg":"Gym list available","data":[{"id":1,"name":"Omark Fit Hit","duration":"12 months","amount":"5000","details":"Get Benifit up to 5000| 15% Off on Upi Payment| 1+1 Scheme for 1 months|1 Month advantage at 1 year subscription"},{"id":2,"name":"Go Fit Now","duration":"6 months","amount":"4000","details":"Get Benifit up to 4000|10% Off on Upi Payment|1+1 Scheme for 1 months|1 Month advantage at 1 year subscription"},{"id":3,"name":"Drewam Slim","duration":"4 months","amount":"3000","details":"Get Benifit up to 3000|15% Off on Upi Payment|1+1 Scheme for 1 months|1 Month advantage at 1 year subscription"}]}';
//     print('response.body');
//     var convertDataToJson = response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     if (status) {
//       var tag = json.decode(convertDataToJson)['data']; //['data'];
//       print(tag);
//       Map<String, dynamic> map = json.decode(convertDataToJson);
//       List<dynamic> dta = [];
//       dta = map["data"];
//       return gymPlanFromJson(json.encode(tag));
//       //final response=await http.get(Uri.parse(GET_GYM_LIST),headers: {HttpHeaders.acceptHeader: "application/json"},);
//       // if(response.statusCode==200)
//       // {
//       //   print(response.body);
//       //   //var convertDataToJson = response.body;
//       //   var status=json.decode(response.body)['status'];
//       //   if(status)
//       //   {
//       //     var tag = json.decode(response.body)['data'];//['data'];
//       //     print(tag);
//       //     Map<String, dynamic> map = json.decode(response.body);
//       //     List<dynamic> dta=[];
//       //     dta = map["data"];
//       //     return gymFromJson(json.encode(tag));
//       //   }
//       // }else
//       // {
//       //   return gymFromJson(json.encode([]));
//       // }
//     }
//   }
//
//   //Get City List Start API
//
  static Future getCategoryList() async
  {
    final response=await http.get(Uri.parse(GET_PRODUCT_CATEGORY),headers: {HttpHeaders.acceptHeader: "application/json"},);
    print(GET_PRODUCT_CATEGORY);
    print(response.body);
    var convertDataToJson = response.body;
      var tag = json.decode(convertDataToJson)['citiesDetails']; //['data'];
      print(tag);
      return nameIdModelFromJson(json.encode(tag));
  }

  static final String GET_PRODUCT_LIST = BASE_URL+"/getProduct";//BASE_URL+"/address";
  static Future getProductList() async
  {
    final response=await http.get(Uri.parse(GET_PRODUCT_CATEGORY),headers: {HttpHeaders.acceptHeader: "application/json"},);
    print(GET_PRODUCT_CATEGORY);
    print(response.body);
    var convertDataToJson = response.body;
    var tag = json.decode(convertDataToJson)['citiesDetails']; //['data'];
    print(tag);
    return nameIdModelFromJson(json.encode(tag));
  }

  // static final String GET_CITY_LIST = BASE_URL+"/city";//BASE_URL+"/address";
  // static Future getAvailableCityList() async
  // {
  //   final response=await http.get(Uri.parse(GET_CITY_LIST),headers: {HttpHeaders.acceptHeader: "application/json"},);
  //   print(GET_CITY_LIST);
  //   print(response.body);
  //   var convertDataToJson = response.body;
  //   var tag = json.decode(convertDataToJson)['citiesDetails']; //['data'];
  //   print(tag);
  //   return nameIdBeanFromJson(json.encode(tag));
  // }
//
//   //Get Address List start API
//   static final String GET_ADDRESS_LIST = BASE_URL+"/address";
//   static Future getAddressList() async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     String token="4****";
//     String type="address_list";
//     final response = await http.post(Uri.parse(GET_ADDRESS_LIST),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         //headers: {"Accept": "application/json","Content-type": "multipart/form-data"},
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         //body: json.encode({"userId": '$userId',"type": 'address_list',"token": '4****'},));
//         body: json.encode({"userId": userId,"type": 'address_list',"token": '$token'}));
//     print(GET_ADDRESS_LIST);
//     print(json.encode({"userId": userId, "token": '$token'}));
//     print(response.body);
//     var convertDataToJson = response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     if (status) {
//       var tag = json.decode(convertDataToJson)['data']; //['data'];
//       print(tag);
//       // Map<String, dynamic> map = json.decode(convertDataToJson);
//       // List<dynamic> dta = [];
//       // dta = map["details"];
//       return addressFromJson(json.encode(tag));
//     }
//   }
//
//   static final String GET_PLAN_AVAILABLITY = BASE_URL+"/subscriptionplanned";
//   static getPlanAvailablity(String planId) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     String token="4****";
//     String type="address_list";
//     final response = await http.post(Uri.parse(GET_PLAN_AVAILABLITY),
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         //body: json.encode({"userId": '$userId',"type": 'address_list',"token": '4****'},));
//         body: json.encode({"userId": userId,"planId": planId,"token": '$token'}));
//     print(GET_PLAN_AVAILABLITY);
//     print(json.encode({"userId": userId,"planId": planId,"token": '$token'}));
//     print(response.body);
//     var convertDataToJson = response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     print(status);
//     return status;
//     // if (status)
//     // return true;
//     // else
//     // return false;
//   }
//
//   static Future getSubscribedPlanList() async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(GET_SUBSCRIBED_PLAN_LIST),
//         headers: {HttpHeaders.acceptHeader: "application/json"},
//         body: json.encode({"userId": '$userId'}));
//     print(json.encode({"userId": '$userId'}));
//     print(response.body);
//     var convertDataToJson = response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     if (status)
//     {
//       var tag = json.decode(convertDataToJson)['details']; //['data'];
//       print(tag);
//       return subscribedPlanFromJson(json.encode(tag));
//     }
//   }
//
  Future getHomeData() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    // final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
    //     headers: {HttpHeaders.acceptHeader: "application/json"},
    //     body: json.encode({"userId": '$userId'}));
    // print(response.body);
    var convertDataToJson = '{"data":[{"id":1,"title":"it is title","sub_title":"it is sub title","description":"it is description","thumble":"thumbnil-1.jpg","author":"Raemsh Singh","rating":"4.5"},{"id":1,"title":"it is title","description":"it is description","sub_title":"it is sub title","thumble":"thumbnil-1.jpg","author":"Raemsh Singh","rating":"4.5"}],"wallet_balance":"245","score":"654","status":true}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

  Future getProductData() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    // final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
    //     headers: {HttpHeaders.acceptHeader: "application/json"},
    //     body: json.encode({"userId": '$userId'}));
    // print(response.body);
    var convertDataToJson = '{"status":true, "categoryList":[{"id":1,"name":"Stationary"},{"id":2,"name":"Civil"},{"id":3,"name":"Electronic"}],"productList":[{"id":1,"categoryId":1,"name":"Glue Gun","price":205,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"},{"id":2,"categoryId":3,"name":"Sparkleing","price":520,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"},{"id":3,"categoryId":1,"name":"Glue Ring","price":720,"image":"https://popuplearning.pk/wp-content/uploads/2020/02/1-141-dc-gear-motor-for-robot-2-motors-with-wheels.jpg"}]}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

  Future getProjectProcessData() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    // final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
    //     headers: {HttpHeaders.acceptHeader: "application/json"},
    //     body: json.encode({"userId": '$userId'}));
    // print(response.body);
    var convertDataToJson = '{"status":true,"progressList":[{"domain":"Paint","measure":23},{"domain":"Board","measure":10},{"domain":"Pin","measure":35},{"domain":"Glue","measure":2},{"domain":"Pencil","measure":7}],"total_project":3,"complete_project":1}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

  Future getOrderListData() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    // final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
    //     headers: {HttpHeaders.acceptHeader: "application/json"},
    //     body: json.encode({"userId": '$userId'}));
    // print(response.body);
    var convertDataToJson = '{"status":true,"orderList":[{"id":1024,"date":"12/12/2020","total_amount":720,"status":1,"itemList":[{"id":1,"productName":"Scesior ","quantity":2,"amount":170},{"id":1,"productName":"Frame","quantity":2,"amount":35}]},{"id":1024,"date":"12/12/2020","total_amount":1250,"status":1,"itemList":[{"id":1,"productName":"Glue Gun","quantity":3,"amount":957}]},{"id":1024,"date":"12/12/2020","total_amount":1920,"status":2,"itemList":[{"id":1,"productName":"Glue Gun","quantity":1,"amount":379}]}]}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

  Future getProjectData() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    // final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
    //     headers: {HttpHeaders.acceptHeader: "application/json"},
    //     body: json.encode({"userId": '$userId'}));
    // print(response.body);
    var convertDataToJson = '{"data":[{"id":1,"title":"it is title","sub_title":"it is sub title","description":"it is description","thumble":"thumbnil-1.jpg","author":"Raemsh Singh","rating":"4.5"},{"id":1,"title":"it is title","description":"it is description","sub_title":"it is sub title","thumble":"thumbnil-1.jpg","author":"Raemsh Singh","rating":"4.5"}],"wallet_balance":"245","score":"654","status":true}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      print(tag);
      return tag;
    }
  }

//
//   static Future getHomeData() async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(GET_HOME_OFFER_LIST),
//         headers: {HttpHeaders.acceptHeader: "application/json"},
//         body: json.encode({"userId": '$userId'}));
//     print(response.body);
//     var convertDataToJson = response.body;//'{"status":true,"msg":"Gym list available","data":[{"id":3,"image":"1640690592.jpg","type":"gym","type_id":"11"},{"id":3,"image":"1640787153.jpg","type":"product","type_id":"4"},{"id":3,"image":"1640699447.jpg","type":"gym","type_id":"16"}]}';//response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     if (status) {
//       var tag = json.decode(convertDataToJson)['data']; //['data'];
//       print(tag);
//       return homeFromJson(json.encode(tag));
//     }
//     // var tag = json.decode(convertDataToJson)['data']; //['data'];
//     // print(tag);
//     // return homeFromJson(json.encode(tag));
//   }
//
//
//   static Future purchasePlan(transactionId, userId, planId) async
//   {
//     print(GET_Subscription);
//     final response = await http.post(Uri.parse(GET_Subscription),
//         headers: {HttpHeaders.acceptHeader: "application/json"},
//         body: json.encode({"userId": '$userId', "transactionId": '$transactionId', "planId": '$planId'}));
//     print(json.encode({"userId": '$userId', "transactionId": '$transactionId', "planId": '$planId'}));
//     print(response.body.toString());
//     var ConvertDataToJson = jsonDecode(response.body);
//
//     return ConvertDataToJson;
//   }
//    Future placeOrder(String transactionId,int userId,int address_id) async
//   {
//    // print(GET_Subscription);
//     final response = await http.post(Uri.parse(PlaceOrder),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({"userId": '$userId',
//           "transactionId": '$transactionId',
//           "address_id": address_id,
//           "token":'4****',
//           "type":'updateall'}));
//     print(json.encode({"userId": '$userId',
//       "transactionId": '$transactionId',
//       "address_id": address_id,
//       "token":'4****',
//       "type":'updateall'}));
//     print(response.body.toString());
//     var ConvertDataToJson = jsonDecode(response.body);
//
//     return ConvertDataToJson;
//   }
  Future setProfile(String studentName,String parentName,String dateOfBirth,String schoolName,String mobile,String email,String gender,String gender_type) async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getString("userId");
    // final response = await http.post(Uri.parse(GET_PROFILE),
    //     //headers: {HttpHeaders.acceptHeader: "application/json"},
    //     headers: <String, String>
    //     {
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: json.encode({"studentName":studentName,"parentName":parentName,"dateOfBirth":dateOfBirth,"schoolName":schoolName,"mobile":mobile,"email":email,"gender":gender,"gender_type":gender_type}));
    // print(json.encode({"userId": '$userId'}));
    //var response = json.decode('{"data":[{"id":2,"name":"ter","address":"dfgvsdf sdf","image":"1630421034.png","facility_id":"1,2,3,4,5","rating":3.5}],"status":true,"msg":"success"}');//['data'];
    //var ConvertDataToJson = jsonDecode(response.body['data']);

    var convertDataToJson = '{"status":true,"msg":"Gym list available","data":[{"studentName":"Mas. Avdhesh Sharma","parentName":"Mr. Sumit Sharma","dateOfBirth":"13/06/1985","schoolName":"SVA","mobile":"98765432156","email":"ash@gmal.com","gender":"male"}]}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      //print(tag);
      return tag;
    }

    return convertDataToJson;
  }

  Future createProject(String projectTitle,String projectDescription,String startDate,String endDate,String sketch,String ageGroup) async
  {

  final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getString("userId");
    // final response = await http.post(Uri.parse(GET_PROFILE),
    //     //headers: {HttpHeaders.acceptHeader: "application/json"},
    //     headers: <String, String>
    //     {
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: json.encode({"projectTitle":projectTitle,
  // "projectDescription":projectDescription,
  // "startDate":startDate,
  // "endDate":endDate,
  // "sketch":sketch,
  // "ageGroup":ageGroup,}));
    // print(json.encode({"userId": '$userId'}));
    //var response = json.decode('{"data":[{"id":2,"name":"ter","address":"dfgvsdf sdf","image":"1630421034.png","facility_id":"1,2,3,4,5","rating":3.5}],"status":true,"msg":"success"}');//['data'];
    //var ConvertDataToJson = jsonDecode(response.body['data']);

    var convertDataToJson = '{"status":true,"msg":"Project Created Successfully"}';//response.body;
    var status = json.decode(convertDataToJson)['status'];
    if (status)
    {
      var tag = json.decode(convertDataToJson); //['data'];
      //print(tag);
      return tag;
    }

    return convertDataToJson;
  }

  Future updateProfile() async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getString("userId");
    final response = await http.post(Uri.parse(UPDATE_PROFILE),
        //headers: {HttpHeaders.acceptHeader: "application/json"},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({"userId": '$userId'}));
    print(json.encode({"userId": '$userId'}));
    print(response.body.toString());
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }


  Future uploadImage(String image) async
  {
    final prefs = await SharedPreferences.getInstance();
    var userId=prefs.getInt("userid");
    print(UPLOAD_IMAGE);
    final response = await http.post(Uri.parse(UPLOAD_IMAGE),
        //headers: {HttpHeaders.acceptHeader: "application/json"},
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "image":'$image',
          "userId":'$userId'
        }));
    print(json.encode({
      "userId":'$userId',
      "image":'$image'
    }));

    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

  // Future uploadScrapImage(String image) async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getInt("userid");
  //   print(UPLOAD_IMAGE);
  //   final response = await http.post(Uri.parse(UPLOAD_SCRAP_IMAGE),
  //       //headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({
  //         "image":'$image',
  //       }));
  //   print(json.encode({
  //     "image":'$image'
  //   }));
  //
  //   var ConvertDataToJson = jsonDecode(response.body);
  //   return ConvertDataToJson;
  // }

//
//
//   //{"token":"4****","userId":"11","name":"Amit", "address_type" :"office", "address":"manal softech", "mobile":"789656516","zip":"456010","city":"ujjggfngfnbxin"}
//
//
//   Future deleteAddress(String addressId) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     print(DELETE_ADDRESS);
//     final response = await http.post(Uri.parse(DELETE_ADDRESS),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token":'4****',
//           "userId":'$userId',
//           "key_address_id":'$addressId',
//         }));
//     print(json.encode({
//       // "mobile": '$mobile',
//       // "token": '$token'
//       "token":'4****',
//       "userId":'$userId',
//       "key_address_id":'$addressId'
//     }));
//
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//
//   Future addAddress(String name, String address_type, String address, String mobile, String zip,String city) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(ADD_ADDRESS),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           // "mobile": '$mobile',
//           // "token": '$token'
//           "token":'4****',
//           "userId":'$userId',
//           "name":'$name',
//           "address_type":'$address_type',
//           "address":'$address',
//           "mobile":'$mobile',
//           "zip":'$zip',
//           "city":'$city',
//         }));
//     print(json.encode({
//       // "mobile": '$mobile',
//       // "token": '$token'
//       "token":'4****',
//       "userId":'$userId',
//       "name":'$name',
//       "address_type":'$address_type',
//       "address":'$address',
//       "mobile":'$mobile',
//       "zip":'$zip',
//       "city":'$city',
//     }));
//
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//
//   Future updateAddress(String addressId,String name, String address_type, String address, String mobile, String zip,String city) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(UPDATE_ADDRESS),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           // "mobile": '$mobile',
//           "key_address_Id":'$addressId',
//           "token":'4****',
//           "userId":'$userId',
//           "name":'$name',
//           "address_type":'$address_type',
//           "address":'$address',
//           "mobile":'$mobile',
//           "zip":'$zip',
//           "city":'$city',
//         }));
//     print(json.encode({
//       // "mobile": '$mobile',
//       // "token": '$token'
//       "key_address_Id":'$addressId',
//       "token":'4****',
//       "userId":'$userId',
//       "name":'$name',
//       "address_type":'$address_type',
//       "address":'$address',
//       "mobile":'$mobile',
//       "zip":'$zip',
//       "city":'$city',
//     }));
//
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //UPDATE PROFILE API
//   /*Future updateProfile(String name, String mobile, String email,String image) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(UPDATE_PROFILE),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token":'4****',
//           "userId":'$userId',
//           "f_name":'$name',
//           "mobile":'$mobile',
//           "email":'$email',
//         }));
//     print(json.encode({
//       "token":'4****',
//       "userId":'$userId',
//       "f_name":'$name',
//       "mobile":'$mobile',
//       "email":'$email',
//       "image":'$image',
//     }));
//
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }*/
//   Future updateProfile(String name, String mobile, String email) async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     final response = await http.post(Uri.parse(UPDATE_PROFILE),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token":'4****',
//           "userId":'$userId',
//           "f_name":'$name',
//           "mobile":'$mobile',
//           "email":'$email',
//         }));
//     print(json.encode({
//       "token":'4****',
//       "userId":'$userId',
//       "f_name":'$name',
//       "mobile":'$mobile',
//       "email":'$email',
//     }));
//
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//   //GYM PLAN DETAILS API
//   static Future getGymDetailPlan(String gymId) async
//   {
//     // var tag = json.decode('{"data":[{"id":2,"name":"ter","address":"dfgvsdf sdf","image":"1630421034.png","facility_id":"1,2,3,4,5","rating":3.5}],"status":true,"msg":"success"}')['data'];//['data'];
//     //     print(tag);
//     //     // Map<String, dynamic> map = json.decode(response.body);
//     //     // List<dynamic> dta=[];
//     //     //dta = map["data"];
//     //     return gymFromJson(json.encode(tag));
//     print(GET_GYM_DETAIL);
//     // print("to provider: $id");
//     final response = await http.post(Uri.parse(GET_GYM_DETAIL),
//         headers: {HttpHeaders.acceptHeader: "application/json"},
//         body: json.encode({"gymId": '$gymId'}));
//     ///print(response.body);
//     return response.body;
//     // if(response.statusCode==200)
//     // {
//     //   print(response.body);
//     //   //var convertDataToJson = response.body;
//     //   var status=json.decode(response.body)['status'];
//     //   if(status)
//     //   {
//     //     var tag = json.decode(response.body)['data'];//['data'];
//     //     return gymFromJson(json.encode(tag));
//     //   }
//     // }else
//     // {
//     //   return gymFromJson(json.encode([]));
//     // }
//   }
//
// // List Offfr
//   static final String GET_Coupan_LIST = BASE_URL+"/reward";

//   Future getPriceList() async
//   {
//     final prefs = await SharedPreferences.getInstance();
//     var userId=prefs.getInt("userid");
//     print(GET_PRICE_LIST);
//     final response = await http.post(Uri.parse(GET_PRICE_LIST),
//         // headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({"categoryId": '1'}));
//     print(json.encode({"categoryId": "1"}));
//     print(response.body);
//     var convertDataToJson =response.body;
//     var status = json.decode(convertDataToJson)['status'];
//     if (status)
//     {
//       var tag = json.decode(convertDataToJson)['data']; //['data'];
//       print(tag);
//       return priceListFromJson(json.encode(tag));
//     }
//   }

  // Future getOrderList() async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getString("userId");
  //   print(GET_ORDER_LIST);
  //   final response = await http.post(Uri.parse(GET_ORDER_LIST),
  //       // headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({"userId": userId}));
  //   print(json.encode({"userId": userId}));
  //   print(response.body);
  //   var convertDataToJson =response.body;
  //   var status = json.decode(convertDataToJson)['status'];
  //   if (status)
  //   {
  //     var tag = json.decode(convertDataToJson)['data']; //['data'];
  //     print(tag);
  //     return orderFromJson(json.encode(tag));
  //   }
  // }

  // Future getOrderDetailList(String orderId) async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getString("userId");
  //   print(GET_ORDER_DETAIL_LIST);
  //   final response = await http.post(Uri.parse(GET_ORDER_DETAIL_LIST),
  //       // headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({"orderId": orderId}));
  //   // print(json.encode({"orderId": userId}));
  //   // print(response.body);
  //   var convertDataToJson =jsonDecode(response.body);
  //   return convertDataToJson;
  //   // var status = json.decode(convertDataToJson)['status'];
  //   // if (status)
  //   // {
  //   //   var tag = json.decode(convertDataToJson)['data']; //['data'];
  //   //   return orderDetailModelFromJson(json.encode(tag));
  //   // }
  // }

  // Future getAddressList() async
  // {
  //   final prefs = await SharedPreferences.getInstance();
  //   var userId=prefs.getString("userId");
  //   print(GET_ADDRESS_LIST);
  //   final response = await http.post(Uri.parse(GET_ADDRESS_LIST),
  //       // headers: {HttpHeaders.acceptHeader: "application/json"},
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: json.encode({"userId": userId}));
  //   print(json.encode({"userId": userId}));
  //   print(response.body);
  //   var convertDataToJson =response.body;
  //   var status = json.decode(convertDataToJson)['status'];
  //   if (status)
  //   {
  //     var tag = json.decode(convertDataToJson)['data']; //['data'];
  //     //print(tag);
  //     return addressFromJson(json.encode(tag));
  //   }
  // }

  static final String CITY_LIST = BASE_URL+"getCity";
  Future getCityList() async
  {
    final response=await http.get(Uri.parse(CITY_LIST),headers: {HttpHeaders.acceptHeader: "application/json"},);

    // final response = await http.post(Uri.parse(FD_PLAN_LIST),
    //     headers: {'Content-Type': 'application/json; charset=UTF-8'},
    //     body: json.encode({"agentId": userId,"account_number": '$userId'}));
    var ConvertDataToJson = jsonDecode(response.body);
    return ConvertDataToJson;
  }

// //  remove-mov
//   Future removeAll(String token, int userId) async {
//     print(json.encode({
//       "token": '$token',
//       "userId": '$userId',
//       "type":"cart removal",
//     }));
//     final response = await http.post(Uri.parse(BASE_URL +RemoveAll),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "userId": '$userId',
//           "type":"cart removal",
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     return ConvertDataToJson;
//   }
//
//   //update cart API
//   Future updateCartQty(String token, int userId,List<Map<dynamic, dynamic>> quantity_data) async {
//     print(json.encode({
//       "token": '$token',
//       "userId": '$userId',
//
//       "quantity_data": '$quantity_data',
//
//     }));
//     final response = await http.post(Uri.parse(BASE_URL + UpdateCartQty),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "userId": '$userId',
//           "type": 'updateall',
//           "quantity_data": quantity_data,
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     //var ConvertDataToJson = response.body;
//     return ConvertDataToJson;
//   }
//
//   //Verify Coupon API
//   Future verifyCoupon(String token, int userId,String Coupon,String amount) async {
//     print(json.encode({
//       "token": '$token',
//       "userId":'$userId',
//       "Coupon":'$Coupon',
//       "amount":'$amount',
//
//     }));
//     final response = await http.post(Uri.parse(BASE_URL + Coup),
//         //headers: {HttpHeaders.acceptHeader: "application/json"},
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: json.encode({
//           "token": '$token',
//           "userId":'$userId',
//           "Coupon":'$Coupon',
//           "amount":'$amount',
//         }));
//     var ConvertDataToJson = jsonDecode(response.body);
//     //var ConvertDataToJson = response.body;
//     return ConvertDataToJson;
//   }
}