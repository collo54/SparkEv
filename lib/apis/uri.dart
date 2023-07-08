class URI {
  static const String host = 'routes.googleapis.com';

  Uri routesUri(String value) => Uri(
        scheme: 'https',
        host: host,
        path: 'directions/v2:computeRoutes',
        queryParameters: {'key': value},
      );

  Uri mobileDownloadUri(String value) => Uri(
      scheme: 'https',
      host: host,
      path: 'sushiapi/api/MobileDownload',
      queryParameters: {'lastDownload': value});
}
