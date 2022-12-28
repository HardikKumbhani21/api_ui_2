import 'dart:convert';

import 'package:http/http.dart' as http;

class SignupUserApiServices {
  static Future<bool?> signUpUser(Map<String, dynamic> reqbody) async {
    http.Response response = await http.post(
        Uri.parse("https://codelineinfotech.com/student_api/User/signup.php"),
        body: reqbody);
    var result = jsonDecode(response.body);
    return result['status'];
  }
}
