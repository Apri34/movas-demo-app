import 'package:movas_demo_app/movas/observables/unicorn/unicorn_entity.dart';

class UnicornsE {
  final List<UnicornE> unicorns;

  UnicornsE({required this.unicorns});

  List<Map<String, dynamic>> toMap() {
    return unicorns.map((e) => e.toMap()).toList();
  }

  factory UnicornsE.fromMap(List<dynamic> map) {
    return UnicornsE(unicorns: map.map((e) => UnicornE.fromMap(e)).toList());
  }
}
