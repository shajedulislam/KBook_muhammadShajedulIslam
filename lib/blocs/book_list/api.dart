import 'package:dio/dio.dart';
import 'package:kbook/config/endpoints.dart';
import 'model.dart';

class FetchBooksApi {
  // ignore: missing_return
  Future<Map> request(
    int maxResults,
    int startIndex,
  ) async {
    try {
      Dio dio = new Dio();
      final response = await dio.get(MyEndpoints.books(maxResults, startIndex));
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
