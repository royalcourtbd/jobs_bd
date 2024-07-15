import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/device_info_model.dart';

class DeviceInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDeviceInfo(DeviceInfoModel deviceInfo) async {
    await _firestore.collection(Urls.deviceInfo).add(deviceInfo.toJson());
  }

  Future<bool> deviceIdExists(String deviceId) async {
    final querySnapshot = await _firestore
        .collection(Urls.deviceInfo)
        .where('deviceId', isEqualTo: deviceId)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }
}
