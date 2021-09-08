import 'package:movas/movas.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_entity.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> streamProviders = [
  Provider<PublishSubject<UnicornsE>>(
    lazy: false,
    create: (context) => PublishSubject(sync: true),
    dispose: (_, stream) => stream.close(),
  ),
];