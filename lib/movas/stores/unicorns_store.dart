import 'package:movas/movas.dart';
import 'package:movas/provider/provider.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorn_observable.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_entity.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_observable.dart';

class UnicornsStore extends Store<UnicornsO> {
  UnicornsStore(PublishSubject<UnicornsE> unicorns$) {
    listen(unicorns$, (unicornsE) => add(UnicornsO.fromE(unicornsE as UnicornsE)));
  }

  Future<void> createUnicorn(UnicornO unicornO) async {
    UnicornsO? unicornsO = o$[UnicornsO]?.valueWrapper?.value;
    if (unicornsO == null) {
      unicornsO = UnicornsO(unicorns: []);
    }
    return add(unicornsO.copyWith(unicorns: unicornsO.unicorns..add(unicornO)));
  }

  Future<void> deleteUnicorn(String id) async {
    UnicornsO? unicornsO = o$[UnicornsO]?.valueWrapper?.value;
    if (unicornsO == null) {
      unicornsO = UnicornsO(unicorns: []);
    }
    return add(
      unicornsO.copyWith(
        unicorns: unicornsO.unicorns
          ..removeWhere((element) => element.id == id),
      ),
    );
  }
}
