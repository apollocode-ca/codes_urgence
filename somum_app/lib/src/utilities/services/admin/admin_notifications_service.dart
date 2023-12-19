import 'package:apollocode_dart_utilities/apollocode_dart_utilities.dart';
import 'package:somum_utilities/entities/notification_entity.dart';

class AdminNotificationsService
    extends StandardCrudService<NotificationEntity, NotificationEntity> {
  AdminNotificationsService({
    required super.apiToken,
    required super.baseUrl,
    required super.endpoint,
    required super.entityFromMap,
    required super.modelFromMap,
    required super.getAuthToken,
  });
}
