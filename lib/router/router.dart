import 'package:movas/movas.dart';
import 'package:movas_demo_app/movas/views/unicorns/unicorns_page.dart';

var router = Router(
  initialRoute: RouteName.home,
  useDemo: false,
  routes: {
    RouteName.home: (context) => UnicornsPage(),
  },
  demoRoutes: {},
);

class RouteName {
  static const String home = "home";
}
