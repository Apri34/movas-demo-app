import 'package:movas/movas.dart';
import 'package:movas_demo_app/movas/observables/unicorn/unicorns_observable.dart';
import 'package:movas_demo_app/movas/stores/unicorns_store.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> storeProviders = [
  StoreProvider<UnicornsStore, UnicornsO>(
    storeBuilder: (context) => UnicornsStore(
      StaticProvider.of(context),
    ),
  ),
];
