import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:somum_utilities/entities/user_entity.dart';

class UsersService extends StandardCrudService<User, User> {
  UsersService({
    required super.apiToken,
    required super.baseUrl,
    required super.endpoint,
    required super.entityFromMap,
    required super.modelFromMap,
    required super.getAuthToken,
  });
}
