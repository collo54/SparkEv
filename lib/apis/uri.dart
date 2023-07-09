class URI {
  static const String hostRoutes = 'routes.googleapis.com';
  static const String hostMaps = 'maps.googleapis.com';

  Uri routesUri(String value) => Uri(
        scheme: 'https',
        host: hostRoutes,
        path: 'directions/v2:computeRoutes',
        queryParameters: {'key': value},
      );

  Uri reversegeocodingUri(String value, double lat, double lang) => Uri(
        scheme: 'https',
        host: hostMaps,
        path: 'maps/api/geocode/json',
        queryParameters: {
          'latlng': '$lat,$lang',
          'result_type': 'country',
          'key': value,
        },
      );
}
