import 'package:flutter/cupertino.dart';
import 'package:movas/movas.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_entity.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_observable.dart';
import 'package:movas_demo_app/movas/services/unicorns/unicorns_service.dart';
import 'package:movas_demo_app/movas/stores/unicorns_store.dart';

class UnicornsA {
  final UnicornsService unicornsService;
  final UnicornsStore unicornsStore;

  UnicornsA(
    this.unicornsService,
    this.unicornsStore,
  );

  factory UnicornsA.of(BuildContext context) => UnicornsA(
        StaticProvider.of(context),
        StaticProvider.of(context),
      );

  Future<void> fetchUnicorns() async {
    return unicornsService.fetchUnicorns();
  }

  Future<void> createUnicorn(UnicornO unicornO) async {
    UnicornE unicornE = await unicornsService.createUnicorn(
      UnicornE(
        id: unicornO.id,
        name: unicornO.name,
        color: unicornO.color,
        age: unicornO.age,
      ),
    );
    unicornO = UnicornO.fromE(unicornE);
    unicornsStore.createUnicorn(unicornO);
  }

  Future<void> deleteUnicorn(String id) async {
    id = await unicornsService.deleteUnicorn(id);
    unicornsStore.deleteUnicorn(id);
  }
}
