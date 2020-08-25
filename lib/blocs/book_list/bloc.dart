import 'package:kbook/blocs/book_list/api.dart';
import 'package:rxdart/rxdart.dart';

class FetchBooksBloc {
  Map empty;
  final fetchBooksApi = FetchBooksApi();
  BehaviorSubject _dataFetcher = BehaviorSubject<Map>();
  ValueStream<Map> get fetch => _dataFetcher.stream;

  request(
    String maxResults,
    String startIndex,
  ) async {
    try {
      Map results = await fetchBooksApi.request(maxResults, startIndex);
      _dataFetcher.sink.add(results);
    } catch (e) {
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
