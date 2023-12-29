// class ApiFake {
//   static const String url = "https://fakestoreapi.com";
//   static const String getItemApi = "$url/products";
// }

class Api {
  static const String url = "https://parking.alojovn.com";
  
  static const String urlToken = "https://parking.alojovn.com/v1/api/Token";
  static const String login = "$url/v1/api/User/login?";
  static const String addNewVehicle = "$url/v1/api/Vehicle";
  static const String getAccessLog =
      "$url/v1/api/Vehicleaccesslogs/search?searchKey=";
  static const String searchVehicle = "$url/v1/api/Vehicle/search?searchKey=";
  static const String searchPhone = "$url/v1/api/User/check-phone-exist?phone=";
  static const String getListAccessary =
      "$url/v1/api/Phutung?page=1&itemsPerPage=100";
  static const String getUserByPhone =
      "$url/v1/api/User/get-user-info-by-phone?phone=";
  static const String getInvoiceByUserID =
      "$url/v1/api/Hdsuaxe/search?searchKey=";
  // static const String signup = "$url/api/public/register";
}
