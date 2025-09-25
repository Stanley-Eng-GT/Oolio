enum RequestMethod {
  get,
  post,
  put,
  delete,
}

extension RequestMethodExtension on RequestMethod {
  String get value => toString().split('.').last.toUpperCase();
}
