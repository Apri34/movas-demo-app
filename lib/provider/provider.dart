import 'package:movas_demo_app/provider/service_providers.dart';
import 'package:movas_demo_app/provider/store_providers.dart';
import 'package:movas_demo_app/provider/stream_providers.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...streamProviders,
  ...serviceProviders,
  ...storeProviders,
];
