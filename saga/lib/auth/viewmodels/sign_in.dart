import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/api/api.dart';
import 'package:saga/auth/models/session.dart';
import 'package:saga/auth/models/user.dart';
import 'package:saga/core/database.dart';

part 'sign_in.g.dart';

@riverpod
Future<User?> googleSignIn(Ref ref) async {
  const iosClientId = '511737230605-prh26c9lo5vgaggcaa20bidum73eous7.apps.googleusercontent.com';

  final googleSignIn = GoogleSignIn(clientId: iosClientId, scopes: ['email', 'profile', 'openid']);
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;

  final dioClient = ref.read(dioClientProvider);

  final response = await SagaApi(dioClient).social(
    SocialRequest(
      idToken: IdToken(
        token: googleAuth.idToken!,
        accessToken: googleAuth.accessToken,
        refreshToken: null,
        expiresAt: null,
      ),
      device: await _deviceInfo(),
      provider: SocialProvider.google,
    ),
  );

  await ref.read(databaseProvider).users.insertOnConflictUpdate(response.user.toDrift());
  await ref.read(databaseProvider).sessions.insertOnConflictUpdate(response.session.toDrift());

  return response.user;
}

/// Returns the device information for the current platform.
Future<DeviceRequest> _deviceInfo() async {
  final deviceInfo = DeviceInfoPlugin();

  if (kIsWeb) {
    final webInfo = await deviceInfo.webBrowserInfo;

    return DeviceRequest(
      name: switch (webInfo.browserName) {
        BrowserName.chrome => 'Chrome',
        BrowserName.firefox => 'Firefox',
        BrowserName.safari => 'Safari',
        BrowserName.edge => 'Edge',
        BrowserName.opera => 'Opera',
        BrowserName.msie => 'Microsoft Internet Explorer',
        BrowserName.samsungInternet => 'Samsung Internet',
        BrowserName.unknown => 'Unknown',
      },
      type: DeviceType.web,
    );
  }

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    final brand = androidInfo.brand;
    return DeviceRequest(
      name: '${brand.replaceFirst(brand[0], brand[0].toUpperCase())} ${androidInfo.model}',
      type: DeviceType.android,
    );
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    return DeviceRequest(name: iosInfo.localizedModel, type: DeviceType.ios);
  } else if (Platform.isWindows) {
    final windowsInfo = await deviceInfo.windowsInfo;
    return DeviceRequest(name: windowsInfo.computerName, type: DeviceType.windows);
  } else if (Platform.isMacOS) {
    final macOsInfo = await deviceInfo.macOsInfo;
    return DeviceRequest(name: macOsInfo.computerName, type: DeviceType.macos);
  } else if (Platform.isLinux) {
    final linuxInfo = await deviceInfo.linuxInfo;
    return DeviceRequest(name: linuxInfo.prettyName, type: DeviceType.linux);
  } else {
    throw Exception('unsupported_device');
  }
}
