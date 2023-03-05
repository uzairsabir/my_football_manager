// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:connectivity_for_web/connectivity_for_web.dart';
import 'package:device_info_plus_web/device_info_plus_web.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:flutter_native_splash/flutter_native_splash_web.dart';
import 'package:flutter_secure_storage_web/flutter_secure_storage_web.dart';
import 'package:location_web/location_web.dart';
import 'package:pdfx/src/renderer/web/pdfx_plugin.dart';
import 'package:platform_device_id_web/platform_device_id_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  ConnectivityPlugin.registerWith(registrar);
  DeviceInfoPlusPlugin.registerWith(registrar);
  FileSaverWeb.registerWith(registrar);
  FlutterNativeSplashWeb.registerWith(registrar);
  FlutterSecureStorageWeb.registerWith(registrar);
  LocationWebPlugin.registerWith(registrar);
  PdfxPlugin.registerWith(registrar);
  PlatformDeviceIdWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  UrlLauncherPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
