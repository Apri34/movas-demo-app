import 'dart:convert';

import 'package:movas/movas.dart';
import 'package:movas_demo_app/constants/api.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_entity.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_entity.dart';
import 'package:movas_demo_app/movas/services/unicorns/unicorns_service.dart';
import 'package:http/http.dart' as http;

class RestUnicornsService extends UnicornsService {
  final String path = "unicorns";

  final PublishSubject<UnicornsE> unicorns$;

  RestUnicornsService(this.unicorns$);

  Map<String, String> get headers => {
    "content-type": "application/json",
  };

  @override
  Future<UnicornE> createUnicorn(UnicornE unicornE) async {
    final response = await http.post(
      Uri.parse("$base_url/$api_key/$path"),
      body: jsonEncode(unicornE.toMap()),
      headers: headers,
    );
    if (response.statusCode == 201) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return UnicornE.fromMap(data);
    } else {
      throw Exception();
      // Do some error handling
    }
  }

  @override
  Future<String> deleteUnicorn(String id) async {
    final response = await http.delete(
      Uri.parse("$base_url/$api_key/$path/$id"),
    );
    if (response.statusCode == 200) {
      return id;
    } else {
      throw Exception();
      // Do some error handling
    }
  }

  @override
  Future<void> fetchUnicorns() async {
    final response = await http.get(
      Uri.parse("$base_url/$api_key/$path"),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      UnicornsE unicornsE = UnicornsE.fromMap(data);
      unicorns$.add(unicornsE);
    } else {
      throw Exception();
      // Do some error handling
    }
  }

  @override
  Future<void> dispose() async {
    await unicorns$.close();
  }
}
