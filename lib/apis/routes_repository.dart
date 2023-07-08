import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:spark_ev/apis/uri.dart';
import 'package:spark_ev/models/routes_request.dart';
import 'package:spark_ev/models/routes_response.dart';
import 'package:dio/dio.dart';
//import 'package:http/http.dart' as http;

import 'env.dart';

class RoutesRepository {
  RoutesRepository(this.uri);
  final URI uri;
  final dio = Dio();

  static const String routesBaseUrl =
      'https://routes.googleapis.com/directions/v2:computeRoutes';

  /*
  Future<RouteResponseModel> getRoutes({
    required RoutesRequestModel requestModel,
  }) async {
    //final body = requestModel.toMap();
    // 'X-goog-api-key': key,
    // routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline
    final response = await http.post(
      uri.routesUri(key),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Goog-FieldMask': '*',
      },
      body: jsonEncode(requestModel.toMap().toString()),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      return RouteResponseModel.fromJson(data);
    }

    debugPrint(
      'Request ${uri.routesUri(key)} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}',
    );

    throw response;
  }
  */

  Future<RouteResponseModel> getRoutes1({
    required RoutesRequestModel requestModel,
  }) async {
    //final body = requestModel.toMap();
    // 'X-goog-api-key': key,
    // routes.duration,routes.distanceMeters,routes.polyline.encodedPolyline
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
}
