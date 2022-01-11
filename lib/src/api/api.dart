import 'package:dio/dio.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {'api_key':'1185634cc03cc749f5ca81aa62d400fb'}
));