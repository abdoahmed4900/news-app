// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/main.dart';
import 'package:flutter/material.dart';

import 'package:news_app/news_api/News.dart';
import 'package:news_app/screens/Loading.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('widget tester', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final view = find.byWidget(Loading());

    expect(view, findsOneWidget);

    await tester.pump();
  });
}
