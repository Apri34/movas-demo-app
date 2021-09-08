import 'package:movas/movas.dart';
import 'package:movas_demo_app/movas/services/unicorns/rest_unicorns_service.dart';
import 'package:movas_demo_app/movas/services/unicorns/unicorns_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> serviceProviders = [
  Provider<UnicornsService>(
    lazy: false,
    create: (context) => RestUnicornsService(
      StaticProvider.of(context),
    ),
    dispose: (context, service) => service.dispose(),
  ),
];
