import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';
import 'package:d3/selection/selection.dart';

main() {
  useHtmlEnhancedConfiguration();

  group('select(body)', () {
    group('on a simple page', () {
      final Selection body = new Selection.selector('body');
      test('calls the function once per element', () {
        var count = 0;
        body.each((n, d, i, j) { ++count; });
        expect(count, equals(1));
      });
      test('passes the data and index to the function', () {
        var data = new Object(), dd, ii;
        body.data([data]).each((n, d, i, j) { dd = d; ii = i; });
        expect(dd, same(data));
        expect(ii, same(0));
      });
      test('uses the node as the context', () {
        var node = null;
        body.each((n, d, i, j) { node = n; });
        expect(node, same(body.node));
      });
      test('returns the same selection', () {
        expect(body.each((n, d, i, j) {}), same(body));
      });
      test('returns the current selection', () {
        expect(body.each((n, d, i, j) {}), same(body));
      });
      test('ignores null nodes', () {
        var count = 0;
        body[0][0] = null;
        body.each((n, d, i, j) { ++count; });
        expect(count, equals(0));
      });
    });
  });
}
