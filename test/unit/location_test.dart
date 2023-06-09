import 'package:lesson01/models/location.dart';
import 'package:test/test.dart';

void main() {
  test('test /locations and /locations/:id', () async {
    var locations = await Location.fetchAll();
    for (var location in locations) {
      expect(location.name, hasLength(greaterThan(0)));
      expect(location.url, hasLength(greaterThan(0)));

      final fetchedLocation = await Location.fetchByID(location.id!);
      expect(fetchedLocation.name, equals(location.name));
      expect(fetchedLocation.url, equals(location.url));
    }
  });
}
