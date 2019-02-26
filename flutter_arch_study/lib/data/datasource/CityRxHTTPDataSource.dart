import 'package:flutter_arch_study/data/datasource/interface/CityDataSourceInterface.dart';
import 'package:flutter_arch_study/data/datasource/RxHTTPDataSource.dart';
import 'package:flutter_arch_study/data/entity/CityEntity.dart';
import 'package:http/http.dart' show Client;
import 'package:rxdart/rxdart.dart' show Observable;

class CityRxHTTPDataSource extends RxHTTPDataSource
    implements CityDataSourceInterface {
  CityRxHTTPDataSource(Client client) : super(client);

  final _zomatoAPIKey = "7fb7edae45fde8015ed29cfe17fcae25";
  final _host = "developers.zomato.com";
  final _basePath = "/api/v2.1";

  @override
  Observable<List<CityEntity>> fetchCities(String query) {
    final path = "$_basePath/cities";
    return get(_host, path,
            queryParameters: {"q": query},
            headers: {"user-key": _zomatoAPIKey})
        .map(CityEntity.fromResponse);
  }
}
