import 'package:flutter_practice/bloc/weather/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Location", () {
    group("fromJson", () {
      test("return correct Location Object", () {
        expect(
            Location.fromJson(<String, dynamic>{
              "id": 4887398,
              "name": 'Chicago',
              'latitude': 41.85003,
              'longitude': -87.65005,
            }),
            isA<Location>()
                .having((w) => w.id, 'id', 4887398)
                .having((w) => w.name, 'name', 'Chicago')
                .having((w) => w.latitude, 'latitude', 41.85003)
                .having((w) => w.longitude, 'longitude', -87.65005)
        );
      });
    });
  });
}
