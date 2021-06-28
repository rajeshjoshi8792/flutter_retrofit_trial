import 'package:flutter_retrofit_trial/network/modal/InvestTips_Response.dart';
import 'package:flutter_retrofit_trial/network/modal/LoginResponse.dart';
import 'package:flutter_retrofit_trial/network/modal/RegisterResponse.dart';
import 'package:flutter_retrofit_trial/network/modal/task_model.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://pankrutiinfotech.com/stork/api/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService create() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return ApiService(dio);
  }

  // @GET("photos")
  // Future<List<TaskModel>> getTasks();

  @FormUrlEncoded()
  @POST("users/register")
  Future<RegisterResponse> createUser(@Field("name") String name,
      @Field("phone") int phone,
      @Field("password") String password,
      @Field("email") String email,
      @Field("address") String address);

  @FormUrlEncoded()
  @POST("users/login")
  Future<LoginResponse> loginUser(
      @Field("phone") int phone,
      @Field("password") String password,
  );

  @GET("invest-tips")
  Future<InvestTips_Response> invettips(@Header("Authorization") String authorizationHeader);

}