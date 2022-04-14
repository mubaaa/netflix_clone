// ignore_for_file: unnecessary_null_comparison
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:netflix_project/api/api_url/appi_url.dart';
import 'package:netflix_project/api/model_class/popular.dart';
import 'package:netflix_project/api/model_class/Nowplaying.dart';
import 'package:netflix_project/api/model_class/upcoming.dart';
import 'package:netflix_project/api/model_class/user.dart';

class HttpService {
  User? user;
  Popular? pop;
  NowPlaying? top;
  Upcoming? up;
   List <User>? list;

  static Constantss keyss = Constantss();

  late Dio _dio;
  final baseeUrl = keyss.baseUrl;
  final populr = keyss.popular;
  final topRatd = keyss.nowPlaying;
  final upcom = keyss.upcoming;

  HttpService() {
    _dio = Dio(BaseOptions(baseUrl: baseeUrl));
    initializeInterceptors();
  }

  Future<User?> getReq() async {
    Response response;
    try {
      response = await _dio.get(baseeUrl);
      user = User.fromJson(response.data);
      print(response.data);
    } on SocketException {
      print("netwokkkkk errror");
    } on DioError catch (e) {
      print(e.message);
      return user;
    }
    return user;
  }

  Future<Popular?> popular() async {
    Response response;
    try {
      response = await _dio.get(populr);
      pop = Popular.fromJson(response.data);
      print(response.data);
    } on SocketException {
      print("netwokkkkk errror");
    } on DioError catch (e) {
      print(e.message);
      return pop;
    }
    return pop;
  }

  Future<NowPlaying?> nowPlaying() async {
    Response response;
    try {
      response = await _dio.get(topRatd);
      top = NowPlaying.fromJson(response.data);
      print(response.data);
    } on SocketException {
      print("netwokkkkk errror");
    } on DioError catch (e) {
      print(e.message);
      return top;
    }
    return top;
  }

  Future<Upcoming?> upcoming() async {
    Response response;
    try {
      response = await _dio.get(upcom);
      up = Upcoming.fromJson(response.data);
      print(response.data);
    } on SocketException {
      print("netwokkkkk errror");
    } on DioError catch (e) {
      print(e.message);
      return up;
    }
    return up;
  }

  Future<List<User>?>searchKey() async{
   Response response;
   try {
     response =await _dio.post(baseeUrl);
     list =User.fromJson(response.data) as List<User>?;
   } on SocketException {
      print("errrorrrr");
   } on DioError catch(e){
     print(e.message);
     
   }
    return list;
  }
  


  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError:
          (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
        print("errrrrrr${error.message}");
      },
    ),
   );
  }
}
