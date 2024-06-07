import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:jobs_bd/data/dummy_data_model/device_info_model.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<DeviceInfoModel> getDeviceInfo() async {
    var deviceData = <String, dynamic>{};
    if (GetPlatform.isAndroid) {
      var androidInfo = await _deviceInfoPlugin.androidInfo;
      deviceData = {
        'deviceId': androidInfo.id,
        'deviceName': androidInfo.device,
        'osVersion': androidInfo.version.release,
        'manufacturer': androidInfo.manufacturer,
        'model': androidInfo.model,
        'platform': 'Android',
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
      };
    }

    return DeviceInfoModel.fromJson(deviceData);
  }
}
