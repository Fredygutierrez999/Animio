import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animio/pages/AutenticarPage.dart';

void main() {
  group('TaskList', () {
    testWidgets('Should render the collection of tasks',
        (WidgetTester tester) async {
      await tester.pumpWidget(const AutenticarPage());
      expect(find.text('ANIMIO'), findsOneWidget);
    });
  });
}
