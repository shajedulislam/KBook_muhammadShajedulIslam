import 'package:kbook/blocs/book_list/api.dart';
import 'package:kbook/blocs/book_list/model.dart';
import 'package:rxdart/rxdart.dart';

class FetchBooksBloc {
  Map empty;
  final fetchBooksApi = FetchBooksApi();
  BehaviorSubject _dataFetcher = BehaviorSubject<BookModel>();
  ValueStream<BookModel> get fetch => _dataFetcher.stream;

  request({
    int maxResults,
    int startIndex,
  }) async {
    try {
      Map results = await fetchBooksApi.request(maxResults, startIndex);
      _dataFetcher.sink.add(BookModel.fromJson(results));
    } catch (e) {
      print(e);
      _dataFetcher.sink.addError(e);
    }
  }

  clean() {
    _dataFetcher.sink.add(empty);
  }

  dispose() {
    _dataFetcher.close();
  }
}
