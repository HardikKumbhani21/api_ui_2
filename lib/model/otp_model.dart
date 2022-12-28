import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

OtpResponseModel otpResponseModelFromJson(String str) =>
    OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) =>
    json.encode(data.toJson());

class OtpResponseModel {
  OtpResponseModel({
    @required this.status,
    @required this.message,
    @required this.count,
    @required this.response,
  });

  final int? status;
  final String? message;
  final int? count;
  final List<Response>? response;

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpResponseModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        count: json["count"] == null ? null : json["count"],
        response: json["response"] == null
            ? null
            : List<Response>.from(
                json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "count": count == null ? null : count,
        "response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    @required this.userId,
    @required this.mobile,
    @required this.otp,
    @required this.numOfOptSentToday,
  });

  final String? userId;
  final String? mobile;
  final String? otp;
  final int? numOfOptSentToday;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        userId: json["user_id"] == null ? null : json["user_id"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        otp: json["otp"] == null ? null : json["otp"],
        numOfOptSentToday: json["num_of_opt_sent_today"] == null
            ? null
            : json["num_of_opt_sent_today"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "mobile": mobile == null ? null : mobile,
        "otp": otp == null ? null : otp,
        "num_of_opt_sent_today":
            numOfOptSentToday == null ? null : numOfOptSentToday,
      };
}
