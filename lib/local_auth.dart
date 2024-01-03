import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:io';


class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) {
        return false;
      }
      return await _auth.authenticate(
        options: AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true
        ),
          localizedReason: 'Use face Id to authenticate').then((value) {
        if(!value)
        {
          exit(0);
        }
        return true;
      });;
    }
    catch(e)
    {
      debugPrint('Error => ${e}');
      return false;
    }
  }
}