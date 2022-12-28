import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OTPServices {
  static Future sendOTP(String mobileNumber) async {
    Map<String, String> header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0"
    };

    /// to get data stored in local cache/storage/session.
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userId = _prefs.getString("user_id") ?? "";
    Map<String, dynamic> body = {
      "client_key": "1595922666X5f1fd8bb5f662",
      "device_type": "MOB",
      "mobile": mobileNumber,
      "user_id": userId,
    };
    http.Response response = await http.post(
      Uri.parse(
          "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/1"),
      headers: header,
      body: body,
    );

    print(jsonDecode(response.body));

    return jsonDecode(response.body);
  }

  static Future validateOtp(String mobileNumber, String otp) async {
    Map<String, String> header = {
      "Authorization": "\$1\$aRkFpEz3\$qGGbgw/.xtfSv8rvK/j5y0"
    };

    /// to get data stored in local cache/storage/session.
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String userId = _prefs.getString("user_id") ?? "";
    Map<String, dynamic> body = {
      "client_key": "1595922666X5f1fd8bb5f662",
      "device_type": "MOB",
      "mobile": mobileNumber,
      "user_id": userId,
      "otp": otp,
    };
    http.Response response = await http.post(
      Uri.parse(
          "http://scprojects.in.net/projects/skoolmonk/api_/otp/validate/0"),
      headers: header,
      body: body,
    );

    print(jsonDecode(response.body));

    return jsonDecode(response.body);
  }
}
