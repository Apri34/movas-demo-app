import 'package:movas_demo_app/movas/observables/unicorn/unicorn_entity.dart';

class UnicornO {
  final String? id;
  final String? name;
  final String? color;
  final int? age;

  UnicornO({
    this.id,
    this.name,
    this.color,
    this.age,
  });

  factory UnicornO.fromE(UnicornE unicornE) {
    return UnicornO(
      id: unicornE.id,
      name: unicornE.name,
      color: unicornE.color,
      age: unicornE.age,
    );
  }

  UnicornO copyWith({String? name, String? color, int? age}) {
    return UnicornO(
      id: this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      age: age ?? this.age,
    );
  }
}
