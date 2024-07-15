import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jobs_bd/core/static/urls.dart';
import 'package:jobs_bd/data/dummy_data_model/ad_ids_model.dart';

class GoogleAdsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<GoogleAdsModel> fetchAdsUnitIds() {
    return _firestore
        .collection(Urls.adsId)
        .doc('adsUnitId')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return GoogleAdsModel.fromJson(snapshot.data()!);
      } else {
        throw Exception('Failed to fetch ads unit IDs.');
      }
    });
  }
}
