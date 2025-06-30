import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'platform_utils.dart';
import 'pwa_utils.dart';
enum orientation{
  landscape,
  potrait
}
class Screener{
  static bool isMobileBrowser=false;
  static bool isBigScreenBrowser=false;
  static bool isPWA=false;
  static bool isAndroidNative=false;
  static bool isIosNative=false;
  static bool isWindowsNative=false;
  static bool isMacOSNative=false;
  static bool isLinuxNative=false;


  mobileBrowser(BuildContext context,bigScreenOffset,mobileScreenOffset){
    if(kIsWeb){
      if(isStandalonePWA()){
        isPWA=true;
      }
      else if(isMobileUserAgent()){
          isMobileBrowser=true;
      }
      else{
        isBigScreenBrowser=true;
      }
    }

    if(isAndroid())
          isAndroidNative=true;
    if(isIOS())
      isIosNative=true;
    if(isWindows())
      isWindowsNative=true;
    if(isMacOS())
      isMacOSNative=true;
    if(isLinux())
      isLinuxNative=true;

  }

}
