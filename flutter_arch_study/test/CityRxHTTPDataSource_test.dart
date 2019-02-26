import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_arch_study/data/datasource/CityRxHTTPDataSource.dart';

void main() {
  test('Tests if CityRxHTTPDataSource parses CityEntity correctly', () {
    final jsonResponse = {
      'location_suggestions': [
        {
          'id': 1,
          'name': 'São Paulo',
          'country_id': 1,
          'country_name': 'Brasil',
          'country_flag_url':
              'https://b.zmtcdn.com/images/countries/flags/country_30.png',
          'should_experiment_with': 0,
          'discovery_enabled': 0,
          'has_new_ad_format': 0,
          'is_state': 0,
          'state_id': 0,
          'state_name': '',
          'state_code': ''
        }
      ],
      'status': 'success',
      'has_more': 0,
      'has_total': 0
    };

    final mockClient = MockClient((request) async {
      return Response(json.encode(jsonResponse), 200);
    });
    final dataSource = CityRxHTTPDataSource(mockClient);

    dataSource.fetchCities("anyQuery").listen(expectAsync1((data) {
      expect(data.length, 1);
      expect(data[0].id, 1);
      expect(data[0].countryId, 1);
      expect(data[0].name, "São Paulo");
      expect(data[0].countryId, 1);
      expect(data[0].countryName, "Brasil");
    }));
  });
}
