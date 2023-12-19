import 'package:somum/src/configs/environment.dart';
import 'package:somum/src/utilities/services/admin/admin_notifications_service.dart';
import 'package:somum_utilities/somum_utilities.dart';
import 'package:somum_utilities/entities/notification_entity.dart';
import 'package:get_it/get_it.dart';
import 'package:somum/src/utilities/services/admin/admin_users_service.dart';
import 'package:somum/src/utilities/services/users_service.dart';

class AdminServices {

  final user = AdminUsersService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/admin/users',
    entityFromMap: User.fromMap,
    modelFromMap: User.fromMap,
    getAuthToken: () async => "",
  );

  final notifications = AdminNotificationsService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/admin/notifications',
    entityFromMap: NotificationEntity.fromMap,
    modelFromMap: NotificationEntity.fromMap,
    getAuthToken: () async => "",
  );
}

class Services {
  final user = UsersService(
    apiToken: apiToken,
    baseUrl: baseUrl,
    endpoint: '/users',
    entityFromMap: User.fromMap,
    modelFromMap: User.fromMap,
    getAuthToken: () async => "",
  );
}

Future<void> initializeServices() async {
  GetIt.instance.registerSingleton(Services());
  GetIt.instance.registerSingleton(AdminServices());

  await GetIt.instance.allReady();
}

Services get services => GetIt.instance.get<Services>();
AdminServices get adminServices => GetIt.instance.get<AdminServices>();
