import 'package:lesson01/endpoint.dart';
import 'location_fact.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'location.g.dart';

@JsonSerializable()
class Location {
  final int? id;
  final String? name;
  final String? url;
  final String? userItinerarySummary;
  final String? tuorPackageName;
  final List<LocationFact>? facts;

  Location(
      {this.id,
      this.name,
      this.url,
      this.userItinerarySummary,
      this.tuorPackageName,
      this.facts});

  Location.blank()
      : id = 0,
        name = '',
        url = '',
        userItinerarySummary = '',
        tuorPackageName = '',
        facts = [];

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  static Future<List<Location>> fetchAll() async {
    var uri = Endpoint.uri('/locations', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }
    List<Location> list = <Location>[];

    for (var jsonItem in json.decode(resp.body)) {
      list.add(Location.fromJson(jsonItem));
    }

    return list;
  }

  static Future<Location> fetchByID(int id) async {
    var uri = Endpoint.uri('/locations/$id', queryParameters: {});

    final resp = await http.get(uri);

    if (resp.statusCode != 200) {
      throw (resp.body);
    }

    final Map<String, dynamic> itemMap = json.decode(resp.body);

    return Location.fromJson(itemMap);
  }
}
