import 'package:movas_demo_app/movas/observables/unicorn/unicorn_observable.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_entity.dart';

class UnicornsO {
  final List<UnicornO> unicorns;

  UnicornsO({required this.unicorns});

  factory UnicornsO.fromE(UnicornsE unicornsE) {
    return UnicornsO(
      unicorns: unicornsE.unicorns.map((e) => UnicornO.fromE(e)).toList(),
    );
  }

  UnicornsO copyWith({List<UnicornO>? unicorns}) {
    return UnicornsO(unicorns: unicorns ?? this.unicorns);
  }
}
