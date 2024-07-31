import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:jobs_bd/data/dummy_data_model/device_info_model.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<DeviceInfoModel> getDeviceInfo() async {
    var deviceData = <String, dynamic>{};
    String? deviceToken = await _firebaseMessaging.getToken();
    debugPrint('Device Token: $deviceToken');

    if (GetPlatform.isAndroid) {
      var androidInfo = await _deviceInfoPlugin.androidInfo;
      deviceData = {
        'deviceId': androidInfo.id,
        'deviceName': androidInfo.device,
        'osVersion': androidInfo.version.release,
        'manufacturer': androidInfo.manufacturer,
        'model': androidInfo.model,
        'platform': 'Android',
        'deviceToken': deviceToken, // Add this line
      };
    } else if (GetPlatform.isIOS) {
      var iosInfo = await _deviceInfoPlugin.iosInfo;
      deviceData = {
        'deviceId': iosInfo.identifierForVendor,
        'deviceName': iosInfo.name,
        'osVersion': iosInfo.systemVersion,
        'manufacturer': 'Apple',
        'model': iosInfo.utsname.machine,
        'platform': 'iOS',
        'deviceToken': deviceToken, // Add this line
      };
    }

    return DeviceInfoModel.fromJson(deviceData);
  }
}
