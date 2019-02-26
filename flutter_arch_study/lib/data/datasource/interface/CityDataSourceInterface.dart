import 'package:rxdart/rxdart.dart' show Observable;
import 'package:flutter_arch_study/data/entity/CityEntity.dart';

abstract class CityDataSourceInterface {
  Observable<List<CityEntity>> fetchCities(String query);
}