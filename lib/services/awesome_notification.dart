import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwesomeNotificationsService {
  AwesomeNotificationsService._();

  static AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  static init() async {
    await _initNotification();
    await awesomeNotifications.requestPermissionToSendNotifications();
    listenToActionButtons();
  }

  static listenToActionButtons() {
    awesomeNotifications.setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  /// Init notifications channels
  static _initNotification() async {
    await awesomeNotifications.initialize(
      null,
      [
        NotificationChannel(
          channelGroupKey: NotificationChannels.generalChannelGroupKey,
          channelKey: NotificationChannels.generalChannelKey,
          channelName: NotificationChannels.generalChannelName,
          groupKey: NotificationChannels.generalGroupKey,
          channelDescription: NotificationChannels.generalChannelDescription,
          defaultColor: Colors.green,
          ledColor: Colors.white,
          channelShowBadge: true,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: NotificationChannels.generalChannelGroupKey,
          channelGroupName: NotificationChannels.generalChannelGroupName,
        ),
      ],
    );
  }

  // Display notification for user with sound
  static Future showNotification({
    required String title,
    required String body,
    required int id,
    String? channelKey,
    String? groupKey,
    NotificationLayout notificationLayout = NotificationLayout.Default,
    String? summary,
    List<NotificationActionButton>? actionButtons,
    Map<String, String>? payload,
    String? largeIcon,
    final bool schedule = false,
    final int? interval,
  }) async {
    awesomeNotifications.isNotificationAllowed().then((isAllowed) async {
      if (isAllowed) {
        awesomeNotifications.createNotification(
          content: NotificationContent(
            id: id,
            title: title,
            body: body,
            groupKey: groupKey ?? NotificationChannels.generalGroupKey,
            channelKey: channelKey ?? NotificationChannels.generalChannelKey,
            showWhen: true,
            payload: payload,
            notificationLayout: notificationLayout,
            autoDismissible: true,
            summary: summary,
            largeIcon: largeIcon,
          ),
          schedule: schedule
              ? NotificationInterval(
                  interval: interval,
                  timeZone:
                      await awesomeNotifications.getLocalTimeZoneIdentifier(),
                  preciseAlarm: true)
              : null,
          actionButtons: actionButtons,
        );
      } else {}
    });
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {}
}

class NotificationChannels {
  // Chat channel (for messages only)

  // General channel (for all other notifications)
  static String get generalChannelKey => "general_channel";
  static String get generalGroupKey => "general group key";
  static String get generalChannelGroupKey => "general_channel_group";
  static String get generalChannelGroupName => "general notifications channel";
  static String get generalChannelName => "general notifications channels";
  static String get generalChannelDescription =>
      "Notification channel for general notifications";
}
