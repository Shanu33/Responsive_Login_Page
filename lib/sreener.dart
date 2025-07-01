import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'platform_utils.dart';
import 'pwa_utils.dart';

enum ScreenMode { portrait, landscape }
ScreenMode getScreenMode(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return size.width >= size.height ? ScreenMode.landscape : ScreenMode.portrait;
}
class Screener {
  static final bool isMobileBrowser = kIsWeb && !isStandalonePWA() && isMobileUserAgent();
  static final bool isDesktopBrowser = kIsWeb && !isStandalonePWA() && !isMobileUserAgent();

  static final bool isPWA_Mobile = kIsWeb && isStandalonePWA() && isMobileUserAgent();
  static final bool isPWA_Desktop = kIsWeb && isStandalonePWA() && !isMobileUserAgent();

  static final bool isAndroidNative = isAndroid();
  static final bool isIosNative = isIOS();
  static final bool isWindowsNative = isWindows();
  static final bool isMacOSNative = isMacOS();
  static final bool isLinuxNative = isLinux();
}
