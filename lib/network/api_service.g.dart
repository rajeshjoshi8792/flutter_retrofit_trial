// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://pankrutiinfotech.com/stork/api/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<RegisterResponse> createUser(
      name, phone, password, email, address) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(address, 'address');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'name': name,
      'phone': phone,
      'password': password,
      'email': email,
      'address': address
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('users/register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<LoginResponse> loginUser(phone, password) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'phone': phone, 'password': password};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('users/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<InvestTips_Response> invettips(authorizationHeader) async {
    ArgumentError.checkNotNull(authorizationHeader, 'authorizationHeader');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('invest-tips',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'Authorization': authorizationHeader},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = InvestTips_Response.fromJson(_result.data);
    return value;
  }
}
