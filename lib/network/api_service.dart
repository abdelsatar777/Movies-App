import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();
  String baseUrl = "https://api.themoviedb.org/3/";

  get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
