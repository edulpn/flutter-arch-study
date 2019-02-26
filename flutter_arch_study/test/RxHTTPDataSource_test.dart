import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_arch_study/data/datasource/RxHTTPDataSource.dart';
import 'package:http/src/client.dart';
import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

class MockRxHTTPDataSource extends RxHTTPDataSource {
  MockRxHTTPDataSource() : super(Client());
  
  Map<String, String> mockQueryParameters = {"someParameterKey": "someParameterValue"};
  Map<String, String> mockHeaders = {"someHeaderKey": "someHeaderValue"};

  @override
  Observable<Response> get(String host, String path,
      {Map<String, String> queryParameters = const {},
      Map<String, String> headers = const {}}) {
        mockHeaders = headers;
        mockQueryParameters =queryParameters;
        return Observable.never();
    }
}

void main() {
  test('Tests if RxHTTPDataSource handles optional parameters', () {
    final dataSource = MockRxHTTPDataSource();
    dataSource.get("someHost", "somePath");

    expect(dataSource.mockHeaders, {});
    expect(dataSource.mockQueryParameters, {});
  });
}