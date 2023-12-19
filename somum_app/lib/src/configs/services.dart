import 'package:somum/src/configs/environment.dart';
import 'package:somum/src/utilities/services/admin/admin_notifications_service.dart';
import 'package:somum/src/utilities/services/auth0_authentication_service.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:somum_utilities/entities/notification_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:somum/src/utilities/services/admin/admin_users_service.dart';
import 'package:somum/src/utilities/services/users_service.dart';

final _auth = Auth0AuthenticationService(
  auth0ClientId: auth0ClientId,
  auth0Domain: auth0Domain,
);

class AdminServices {
  final auth = _auth;

  final user = AdminUsersService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/admin/users',
    entityFromMap: User.fromMap,
    modelFromMap: User.fromMap,
    getAuthToken: () => _auth.token,
  );

  final notifications = AdminNotificationsService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/admin/notifications',
    entityFromMap: NotificationEntity.fromMap,
    modelFromMap: NotificationEntity.fromMap,
    getAuthToken: () => _auth.token,
  );
}

class Services {
  final auth = _auth;

  final user = UsersService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/users',
    entityFromMap: User.fromMap,
    modelFromMap: User.fromMap,
    getAuthToken: () => _auth.token,
  );
}

Future<void> initializeServices() async {
  GetIt.instance.registerSingleton(Services());
  GetIt.instance.registerSingleton(AdminServices());

  await GetIt.instance.allReady();
}

Services get services => GetIt.instance.get<Services>();
AdminServices get adminServices => GetIt.instance.get<AdminServices>();
