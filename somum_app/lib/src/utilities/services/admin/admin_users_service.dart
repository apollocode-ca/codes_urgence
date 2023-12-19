import 'dart:convert';

import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:somum_utilities/entities/user_entity.dart';
import 'package:http/http.dart' as http;

class AdminUsersService extends StandardCrudService<User, User> {
  AdminUsersService({
    required super.apiToken,
    required super.baseUrl,
    required super.endpoint,
    required super.entityFromMap,
    required super.modelFromMap,
    required super.getAuthToken,
  });

  Future<bool> setUserRole({
    required String role,
    required String userId,
    QueryParamsBuilder? queryParams,
  }) async {
    final token = await getToken('$runtimeType.setUserRole');

    queryParams ??= QueryParamsBuilder({});

    return http
        .patch(
      Uri.parse('$baseUrl/$endpoint/role/$userId$queryParams'),
      headers: {
        if (token != null) 'authorization': 'Bearer $token',
        'content-type': 'application/json',
        'x-auth-token': apiToken,
        ...permanentHeaders,
      },
      body: json.encode({
        'role': role,
      }),
    )
        .then((response) {
      switch (response.statusCode) {
        case 200:
          try {
            return json.decode(response.body) as bool;
          } on Exception catch (exception) {
            throw ServiceError(
              'Failed to decode the response',
              information: exception.toString(),
              location: '$runtimeType.setUserRole',
            );
          }
        default:
          throw ServiceError(
            'Something went wrong',
            errorCode: response.statusCode,
            information: response.reasonPhrase,
            location: '$runtimeType.setUserRole',
          );
      }
    });
  }
}
