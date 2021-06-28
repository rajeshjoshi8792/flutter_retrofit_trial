import 'package:json_annotation/json_annotation.dart';

part 'RegisterResponse.g.dart';

@JsonSerializable()
class RegisterResponse {
  bool success;
  Data data;
  String message;

  RegisterResponse({this.success, this.data, this.message});
  //
  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);


  // RegisterResponse.fromJson(Map<String, dynamic> json) {
  //   success = json['success'];
  //   data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  //   message = json['message'];
  // }


  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['success'] = this.success;
  //   if (this.data != null) {
  //     data['data'] = this.data.toJson();
  //   }
  //   data['message'] = this.message;
  //   return data;
  // }

  Future<void> forEach(Null Function(f) param0) async {}
}

class f {
  String message;
}


@JsonSerializable()
class Data {
  int id;
  String name;
  String email;
  String phone;
  int userId;
  String updatedAt;
  String createdAt;
  String token;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.userId,
        this.updatedAt,
        this.createdAt,
        this.token});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  // Data.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   phone = json['phone'];
  //   userId = json['user_id'];
  //   updatedAt = json['updated_at'];
  //   createdAt = json['created_at'];
  //   token = json['token'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['phone'] = this.phone;
  //   data['user_id'] = this.userId;
  //   data['updated_at'] = this.updatedAt;
  //   data['created_at'] = this.createdAt;
  //   data['token'] = this.token;
  //   return data;
  // }
}
