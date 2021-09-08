import 'package:movas_demo_app/movas/observables/unicorn/unicorn_entity.dart';

abstract class UnicornsService {
  Future<void> fetchUnicorns();
  Future<UnicornE> createUnicorn(UnicornE unicornE);
  Future<String> deleteUnicorn(String id);
  Future<void> dispose();
}