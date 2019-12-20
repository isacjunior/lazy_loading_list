import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';

void main() {
  group('LazyLoadingList', () {
    testWidgets('Should build and find child and compare properties',
        (WidgetTester tester) async {
      void fn() => print('Widget');
      final child = Text(
        'Widget text',
        softWrap: true,
        textDirection: TextDirection.ltr,
      );
      await tester.pumpWidget(LazyLoadingList(
        hasMore: false,
        index: 1,
        loadMore: fn,
        child: child,
      ));
      final lazyFinder = find.byType(Text);
      expect(lazyFinder, findsOneWidget);
      final element = find.byType(LazyLoadingList).evaluate().first.widget
          as LazyLoadingList;
      expect(element.hasMore, false);
      expect(element.index, 1);
      expect(element.loadMore, fn);
      expect(element.child, child);
    });
  });
}
