// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? prefs;

  static initSP() async {
    prefs = await SharedPreferences.getInstance();
  }

  static save(String key, String value) {
    prefs?.setString(key, value);
  }

  static get(String key) {
    return prefs?.get(key);
  }

  static remove(String key) {
    prefs?.remove(key);
  }
}