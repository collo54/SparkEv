import "package:flutter/material.dart";
import 'package:googleapis/bigquery/v2.dart' as bigquery;
import "package:googleapis_auth/auth_io.dart";

///This file contains sensitive information and provided only during the hackathon period please don't share.
// Use service account credentials to obtain oauth credentials.

class QueryData {
  Future<AuthClient> obtainCredentials() async {
    var accountCredentials = ServiceAccountCredentials.fromJson({
      "type": "service_account",
      "private_key_id": "1d4d4c0f74c02e8e23d7ccf81576a0d21705736f",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDQCrqRasyS9ETV\ncp1wWJy99jS0ijHLJErd65hFBtftBlIVSdpzv4wz4CQyhdd0jUW3zf3/omZOQCrW\n1Fn6R/wS+1oV1Izq+CxbDPAEttcmjEVtzWH70h4Cmioos/nZtB/DqY8W9TK4P3si\nIJ2+S9oyIiEBSaGMdafVwVC8y8VFLz7PizRxeRC0t819ZPCGs9mBauV6QK0c4eqj\nypFjCufnRNClaMFEemVyJal6zmA5G7mResS90ARxrIBknVjrwNkTC2mslSwaQuRH\n6VIOqpJX/Sh48mgWy+fkD+ZCxB/moAlY3GkNBa7zzg2f9F0eFLPuaFyOEvWRAII6\nAPQazBIJAgMBAAECggEABhTWNNOCJOaSj4nA6+yPMmdczY0/nOBT9u5A3n2veKyH\nYDtvMRR/mPGbpUVv0aaii9ev7dXVt0Jdbje5ZJ1Pk095J+u1bdXw1/2GE6Ezo1sU\n2XuYOmf/PBS9GEEAk/pVtl7BwcpLoAKtCweYjNxDRdVlERhRql0zGYbD4Sz0uIu2\nO5wIuq5Lxg61CUsZ6OAibUn0mmZvb/+Ehfpex7B+hQOsl0ystOrJLQXn8Wpkfov0\nY7+5hwzhEBpMq4zaptGCrZHHYtrRDpNGiASCsUaxJGjKKu0+UTwiRFh+w/3Fzhfw\n2ZaHlWGVS9QALSEYP9vEmsfzShDrFU53qboujq3wjQKBgQD4AGwVHEktgVSB8XKR\nQfcNxAwhPZzAzXoXCkkeJuK6jp9zxHk68JkmriB1gZodJcn0DbsXXr5i4OA8OZvF\nDv6d1DOc4XI+yYnLObZ+BnKIewWlZR4h4gpFLfYCARtebYZHcgKKFFSJiuWO06Q4\nxE9SNai3LK/Lrzfi6fGVP4ePRQKBgQDWwGL+f4K+X0ES0i8UVs4Pd25ZSTrP47Tc\nYuYje9yD3reFtLPKqqxIPtkTl5wrstAGss3nuwSnahBY5o0o3oH0z+/CSSeuwgeO\nrT66AMBIyfeaGXyl0hPq37ELce135QpDlcEX4D+89QMWP9UnEBsK/WSrKF3mEYyg\nfUfkGnDx9QKBgFdUnrrYWRSDJGUVxwhLuFnKnZLfBWIHeWS/pHvPqauUKaY0m5Qb\nwXKTgq6eUszMz873Pti97kEXex76ElZUL2kYnowx/28IvVMpIZBDaPWSjKxvbSr1\nVDSEOMr/5MldvBlQloBVJGfC149yC7RJvLzwVFccj1MkgoOPahjqZCwZAoGAEW+T\nWghuTBidxvJrwiH+HwFaY0Nv0/sv7wjUmKLw14AYtHFke5r52+/GXjHcCyw8eZ7A\n2wSzLwiMhTtK0LuoH4FWfRbFcwnr5SipxB5VflNvmAJjvW7eER7SWBSK7EYbXDtn\nbxHU+vmFo6PRIZfMKktChicD4K8iFNG3KY0ACJUCgYBC8yG6rzbdwNgv3MCIq+mv\np/K6uh2L3mFhoE9x6YH4FElYVneXHHhw/EloamwDeKf+4/Fn0PRuk64e5sJTpjPa\nWeMyqtTC9DzUF63IPzxl7Qz+vvfZehNI1ZMFsMnwMhkSZ4sAbj7G9upJMWb4moaf\nACvnb6rW/TgNVIknybklsg==\n-----END PRIVATE KEY-----\n",
      "client_email":
          "spark-ev-service@single-obelisk-389301.iam.gserviceaccount.com",
      "client_id": "105678505632038171344",
    });
    var scopes = [bigquery.BigqueryApi.bigqueryScope];

    AuthClient authClient = await clientViaServiceAccount(
      accountCredentials,
      scopes,
    );

    return authClient;
  }

  Future<String> obtainPricePerKwh({
    required AuthClient client1,
    required String country,
  }) async {
    final query = '''
      SELECT Average_price_of_1KW_h__USD_
      FROM [single-obelisk-389301.electricity_prices.global_electricity_prices_per_kwh]
      WHERE country_name = '$country';
      ''';

    final queryRequest = bigquery.QueryRequest.fromJson({
      'query': query,
    });

    final client = bigquery.BigqueryApi(client1);

    final queryResponse = await client.jobs.query(
      queryRequest,
      'single-obelisk-389301',
    );

    if (queryResponse.jobComplete == true &&
        queryResponse.rows != null &&
        queryResponse.rows!.isNotEmpty) {
      final row = queryResponse.rows!.first;
      final value =
          row.f![0].v as String; // Assuming the value is of string type
      debugPrint('Returned value: $value');
      return value;
    } else {
      throw Exception(
          'Failed to fetch value from BigQuery ${queryResponse.errors} .');
    }
  }
}
