import '../../../core/environment/dependency_injection.dart';
import '../../../core/http_manager/http_manager.dart';

class SppHomeLandingRepository {
  SppHomeLandingRepository({
    HttpManager? httpManager,
  })  : _httpManager = httpManager ?? sl<HttpManager>();

  final HttpManager _httpManager;

  
}