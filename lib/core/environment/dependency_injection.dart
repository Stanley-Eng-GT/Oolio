import 'package:get_it/get_it.dart';
import 'package:web_services/http_inspector/http_inspector.dart';

import '../http_manager/http_manager.dart';

final GetIt sl = GetIt.instance;

Future<void> setupDependencies() async {

  final httpInspector = HttpInspector(
    showNotification: false,
  );

  sl.registerSingleton<HttpManager>(HttpManager(
    aliceDioInterceptor: httpInspector.getDioInterceptor(),
  ));
}