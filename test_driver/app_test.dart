import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver? driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    // driver!.close();
  });

  group('ZulhijayaApp', () {
    test('Login Test', () async {
      await driver!.tap(find.byValueKey('login_email'));
      await driver!.enterText('user4@mail.com');
      await driver!.tap(find.byValueKey('login_password'));
      await driver!.enterText('12345678');
      await driver!.tap(find.byValueKey('login_button'));
    });

    test('Add Data Test', () async {
      await driver!.tap(find.byValueKey('home_action_button'));
      await driver!.tap(find.byValueKey('home_action_button_edit'));
      await driver!.tap(find.byValueKey('edit_title'));
      await driver!.enterText('Title dari integration testing');
      await driver!.tap(find.byValueKey('edit_description'));
      await driver!.enterText('Description dari integration testing');
      await driver!.tap(find.byValueKey('edit_save'));
    });

    test('Edit Data Test', () async {
      await driver!.scroll(
        find.byValueKey('home_list_blogs'),
        0,
        -3000,
        const Duration(milliseconds: 500),
      );
      await driver!.tap(find.text('Title dari integration testing'));
      await driver!.tap(find.byValueKey('detail_action_button'));
      await driver!.tap(find.byValueKey('detail_action_button_edit'));
      await driver!.tap(find.byValueKey('edit_title'));
      await driver!.enterText('Title dari integration testing edited');
      await driver!.tap(find.byValueKey('edit_description'));
      await driver!.enterText('Description dari integration testing edited');
      await driver!.tap(find.byValueKey('edit_save'));
    });

    test('Delete Data Test', () async {
      await driver!.tap(find.byValueKey('detail_action_button'));
      await driver!.tap(find.byValueKey('detail_action_button_delete'));
    });

    test('Logout Test', () async {
      await driver!.tap(find.byValueKey('home_action_button'));
      await driver!.tap(find.byValueKey('home_action_button_logout'));
    });
  });
}
