import 'package:google_mobile_ads/google_mobile_ads.dart';

class interstitlaAds {
  InterstitialAd interstitialAd;
  bool isLoaded = false;
  String IdAds = 'ca-app-pub-3513162147938588/8465132971';
  String IdAdsTest = 'ca-app-pub-3940256099942544/1033173712';

  // constracter
  interstitlaAds() {
    initAd();
  }

  void initAd() {
    InterstitialAd.load(
        adUnitId: IdAds,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded, onAdFailedToLoad: onAdFailedToLoad));
  }

  void onAdFailedToLoad(LoadAdError adError) {
    print('ads faild to load? ...');
    print('error traces ...');
    print(adError.code);
  }

  void onAdLoaded(InterstitialAd ad) {
    interstitialAd = ad;
    isLoaded = true;
    interstitialAd.fullScreenContentCallback =
        FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
      interstitialAd.dispose();
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      interstitialAd.dispose();
    });
  }
}
