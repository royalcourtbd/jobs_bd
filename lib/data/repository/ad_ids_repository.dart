import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/data/dummy_data_model/ad_ids_model.dart';

class AdIdsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<AdIdsModel> fetchAdIds() {
    return _firestore
        .collection('ad_ids')
        .doc('ids')
        .snapshots()
        .map((snapshot) {
      final Map<String, dynamic>? data = snapshot.data();
      if (data != null) {
        return AdIdsModel.fromJson(data);
      } else {
        return AdIdsModel(
          banneradsId1: '',
          banneradsId2: '',
          intadsId1: '',
          intadsId2: '',
          videoAdsid: '',
        );
      }
    });
  }
}
