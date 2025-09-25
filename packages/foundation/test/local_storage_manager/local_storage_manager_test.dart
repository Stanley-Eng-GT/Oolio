import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foundation/local_storage_manager/local_storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late LocalStorageManager localStorageManager;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues(
        {'userToken': '123456', 'preferredAccount': 'lp'});
    final sharedPreferences = await SharedPreferences.getInstance();
    localStorageManager = LocalStorageManager();
    localStorageManager.initialize(sharedPreferences: sharedPreferences);
  });

  test('when saving a string locally', () async {
    const keyName = 'userID';
    const keyValue = 'tester';
    final result =
        await localStorageManager.setString(keyName: keyName, value: keyValue);
    expect(result, true);
  });

  test('when getting a local string successfully', () async {
    const keyName = 'userToken';
    final result = localStorageManager.getString(keyName: keyName);
    expect(result, '123456');
  });

  test('when getting a local string with unknown key name', () async {
    const keyName = 'userToken1';
    final result = localStorageManager.getString(keyName: keyName);
    expect(result, null);
  });
}
