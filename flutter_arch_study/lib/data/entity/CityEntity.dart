import 'dart:convert';
import 'package:http/http.dart' show Response;

class CityEntity {
  final int id;
  final String name;
  final int countryId;
  final String countryName;
  final int isState;
  final int stateId;
  final String stateName;
  final String stateCode;

  static List<CityEntity> fromResponse(Response response) {
    final jsonRoot = json.decode(response.body) as Map;
    final jsonArray = jsonRoot["location_suggestions"] as Iterable;
    return jsonArray
        .map((jsonObject) => CityEntity._mappingJson(jsonObject))
        .toList();
  }

  CityEntity._mappingJson(Map json)
      : id = json["id"],
        name = json["name"],
        countryId = json["country_id"],
        countryName = json["country_name"],
        isState = json["is_state"],
        stateId = json["state_id"],
        stateName = json["state_name"],
        stateCode = json["state_code"];
}
