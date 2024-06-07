class DeviceInfoModel {
  final String? deviceId;
  final String? deviceName;
  final String? osVersion;
  final String? manufacturer;
  final String? model;
  final String? platform;

  DeviceInfoModel({
    this.deviceId,
    this.deviceName,
    this.osVersion,
    this.manufacturer,
    this.model,
    this.platform,
  });

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) {
    return DeviceInfoModel(
      deviceId: json['deviceId'],
      deviceName: json['deviceName'],
      osVersion: json['osVersion'],
      manufacturer: json['manufacturer'],
      model: json['model'],
      platform: json['platform'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'deviceName': deviceName,
      'osVersion': osVersion,
      'manufacturer': manufacturer,
      'model': model,
      'platform': platform,
    };
  }
}
