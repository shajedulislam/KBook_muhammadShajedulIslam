import 'package:dio/dio.dart';
import 'package:kbook/config/endpoints.dart';

class FetchBooksApi {
  // ignore: missing_return
  Future<Map> request(
    String maxResults,
    String startIndex,
  ) async {
    Dio dio;
    final response = await dio.get(MyEndpoints.books(maxResults, startIndex));
    if (response.statusCode == 200) {
      return response.data;
    }
  }
}
