import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/device_info_model.dart';

class DeviceInfoRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveDeviceInfo(DeviceInfoModel deviceInfo) async {
    final querySnapshot = await _firestore
        .collection(Urls.deviceInfo)
        .where('deviceId', isEqualTo: deviceInfo.deviceId)
        .get();

    if (querySnapshot.docs.isEmpty) {
      // If device does not exist, add it
      await _firestore.collection(Urls.deviceInfo).add(deviceInfo.toJson());
    } else {
      // If device exists, update the token
      for (var doc in querySnapshot.docs) {
        await _firestore
            .collection(Urls.deviceInfo)
            .doc(doc.id)
            .update({'deviceToken': deviceInfo.deviceToken});
      }
    }
  }
}
