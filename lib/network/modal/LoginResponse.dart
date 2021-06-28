import 'package:flutter_retrofit_trial/network/modal/RegisterResponse.dart';

class LoginResponse {
  bool success;
  Data data;
  String message;

  LoginResponse({this.success, this.data, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson(Null Function(f) param0) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}


  class Data {
  int id;
  int userId;
  int advisor;
  String name;
  String email;
  String phone;
  Null panNumber;
  int plan;
  String segment;
  String capital;
  int tipsType;
  Null profilePic;
  Null otp;
  Null password;
  String profileStatus;
  String createdAt;
  String updatedAt;
  Null deletedAt;
  String token;

  Data(
  {this.id,
  this.userId,
  this.advisor,
  this.name,
  this.email,
  this.phone,
  this.panNumber,
  this.plan,
  this.segment,
  this.capital,
  this.tipsType,
  this.profilePic,
  this.otp,
  this.password,
  this.profileStatus,
  this.createdAt,
  this.updatedAt,
  this.deletedAt,
  this.token});

  Data.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  userId = json['user_id'];
  advisor = json['advisor'];
  name = json['name'];
  email = json['email'];
  phone = json['phone'];
  panNumber = json['pan_number'];
  plan = json['plan'];
  segment = json['segment'];
  capital = json['capital'];
  tipsType = json['tips_type'];
  profilePic = json['profile_pic'];
  otp = json['otp'];
  password = json['password'];
  profileStatus = json['profile_status'];
  createdAt = json['created_at'];
  updatedAt = json['updated_at'];
  deletedAt = json['deleted_at'];
  token = json['token'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['user_id'] = this.userId;
  data['advisor'] = this.advisor;
  data['name'] = this.name;
  data['email'] = this.email;
  data['phone'] = this.phone;
  data['pan_number'] = this.panNumber;
  data['plan'] = this.plan;
  data['segment'] = this.segment;
  data['capital'] = this.capital;
  data['tips_type'] = this.tipsType;
  data['profile_pic'] = this.profilePic;
  data['otp'] = this.otp;
  data['password'] = this.password;
  data['profile_status'] = this.profileStatus;
  data['created_at'] = this.createdAt;
  data['updated_at'] = this.updatedAt;
  data['deleted_at'] = this.deletedAt;
  data['token'] = this.token;
  return data;
  }
  }

