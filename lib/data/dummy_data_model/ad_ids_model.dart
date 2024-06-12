class GoogleAdsModel {
  GoogleAdsModel({
    this.banner1,
    this.banner2,
    this.interstitial1,
    this.interstitial2,
  });

  String? banner1;
  String? banner2;
  String? interstitial1;
  String? interstitial2;

  factory GoogleAdsModel.fromJson(Map<String, dynamic> json) => GoogleAdsModel(
        banner1: json["banner1"],
        banner2: json["banner2"],
        interstitial1: json["interstitial1"],
        interstitial2: json["interstitial2"],
      );

  Map<String, dynamic> toJson() => {
        "banner1": banner1,
        "banner2": banner2,
        "interstitial1": interstitial1,
        "interstitial2": interstitial2,
      };
}
