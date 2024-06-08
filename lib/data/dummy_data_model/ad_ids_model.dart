class AdIdsModel {
  final String banneradsId1;
  final String banneradsId2;
  final String intadsId1;
  final String intadsId2;
  final String videoAdsid;

  AdIdsModel({
    required this.banneradsId1,
    required this.banneradsId2,
    required this.intadsId1,
    required this.intadsId2,
    required this.videoAdsid,
  });

  factory AdIdsModel.fromJson(Map<String, dynamic> json) {
    return AdIdsModel(
      banneradsId1: json['banneradsId1'] ?? '',
      banneradsId2: json['banneradsId2'] ?? '',
      intadsId1: json['intadsId1'] ?? '',
      intadsId2: json['intadsId2'] ?? '',
      videoAdsid: json['videoAdsid'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banneradsId1': banneradsId1,
      'banneradsId2': banneradsId2,
      'intadsId1': intadsId1,
      'intadsId2': intadsId2,
      'videoAdsid': videoAdsid,
    };
  }
}
