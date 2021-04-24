import 'dart:convert';
import 'package:http/http.dart' as http;

class RequestAssistant {
  static Future<dynamic> getRequest(String url) async {
    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        String data = response.body;
        var decodeData = jsonDecode(data);
        // print(decodeData);
        return decodeData;
      } else {
        // return "Failed, No Response.";
        return "failed";
      }
    } catch (exp) {
      return "failed.";
    }
  }
}
