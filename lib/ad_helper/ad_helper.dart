import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static BannerAd myBanner = BannerAd(
    //ca-app-pub-3513162147938588/7144869955 realy id
    //ca-app-pub-3940256099942544/6300978111 test id
    adUnitId: 'ca-app-pub-3513162147938588/7144869955',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  static void disposeAd() {
    myBanner.dispose();
  }
}
