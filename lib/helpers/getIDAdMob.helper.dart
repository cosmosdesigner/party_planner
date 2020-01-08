import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3119842560238936~3333503870';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3119842560238936~5513493393';
  }
  return null;
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3119842560238936/7984578214';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3119842560238936/5694468553';
  }
  return null;
}
String getRewardBasedVideoAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3119842560238936/7984578214';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3119842560238936/9257582690';
  }
  return null;
}

void handleEvent(
    AdmobAdEvent event, Map<String, dynamic> args, String adType) {
  switch (event) {
    case AdmobAdEvent.loaded:
      print('New Admob $adType Ad loaded!');
      break;
    case AdmobAdEvent.opened:
      print('Admob $adType Ad opened!');
      break;
    case AdmobAdEvent.closed:
      print('Admob $adType Ad closed!');
      break;
    case AdmobAdEvent.failedToLoad:
      print('Admob $adType failed to load. :(');
      break;
    case AdmobAdEvent.rewarded:
      print('AdmobAdEvent.rewarded');
      break;
    default:
  }
}