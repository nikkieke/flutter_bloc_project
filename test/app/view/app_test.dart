import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/app/app.dart';


void main() {
    group('App', () { 
      testWidgets('renders AppView', (tester) async{
        await tester.pumpWidget(const AppView());
      expect(find.byType(AppView), findsOneWidget);
      });
    });


    group('AppView', () {
      testWidgets('renders HomePage', (tester) async{
        await tester.pumpWidget(const HomePage());
        expect(find.byType(HomePage), findsOneWidget);
      });
    });
}
