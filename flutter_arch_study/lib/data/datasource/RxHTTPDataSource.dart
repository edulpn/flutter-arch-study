import 'package:rxdart/rxdart.dart' show Observable;
import 'package:http/http.dart';

abstract class RxHTTPDataSource {
  final Client client;
  RxHTTPDataSource(Client client) : this.client = client;

  Observable<Response> get(String host, String path,
      {Map<String, String> queryParameters = const {},
      Map<String, String> headers = const {}}) {
    final uri = Uri.https(host, path, queryParameters);
    return Observable.fromFuture(client.get(uri, headers: headers));
  }
}
