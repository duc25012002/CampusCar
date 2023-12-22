import 'package:http/http.dart' as http;

class Server {
  static String? loginToken;
  static String? tokenAPI;
  postRequest({String? endPoint, String? body}) async {
    try {
      return await http.post(
        Uri.parse(endPoint!),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer YOUR_TOKEN_HERE',
        },
        body: body,
      );
    } catch (e) {
      return null;
    }
  }
}
