import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spark_ev/apis/uri.dart';
import 'package:spark_ev/models/reverse_geocoding_models/reverse_geocoding_response.dart';
import 'package:spark_ev/models/routes_request.dart';
import 'package:spark_ev/models/routes_response.dart';
import 'package:dio/dio.dart';

import 'env.dart';

class Repository {
  Repository(this.uri);
  final URI uri;
  final dio = Dio();

  Future<RouteResponseModel> getRoutes({
    required RoutesRequestModel requestModel,
  }) async {
    final response = await dio.post(
      uri.routesUri(key).toString(),
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'X-Goog-FieldMask':
              'routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline',
        },
      ),
      data: jsonEncode(requestModel.toMap()),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;

      return RouteResponseModel.fromJson(data);
    }

    debugPrint(
      'Request ${uri.routesUri(key)} failed\nResponse: ${response.statusCode} ${response.statusMessage}',
    );

    throw response;
  }

  Future<ReverseGeocoding> reverseGeolocate(
      {required double lat, required double lang}) async {
    final response = await dio.get(
      uri.reversegeocodingUri(key, lat, lang).toString(),
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = response.data;

      return ReverseGeocoding.fromJson(data);
    }

    debugPrint(
      'Request ${uri.routesUri(key)} failed\nResponse: ${response.statusCode} ${response.statusMessage}',
    );

    throw response;
  }
}
