import 'package:test/test.dart';
import 'package:intl/intl.dart';
import '../lib/models/waste_entry.dart';

void main() {
  test('Creating new WasteEntry object correctly returns elements', () {
    final date = DateFormat('EEE, MMM d, ' 'yyyy').format(DateTime.now());
    final url = 'FAKE';
    final quantity = '1';
    final latitude = '2';
    final longitude = '3';

    final wasteEntry = WasteEntry(
        date: date,
        imageURL: url,
        quantity: quantity,
        latitude: latitude,
        longitude: longitude);

    expect(wasteEntry.date, date);
    expect(wasteEntry.imageURL, url);
    expect(wasteEntry.quantity, quantity);
    expect(wasteEntry.latitude, latitude);
    expect(wasteEntry.longitude, longitude);
  });

  test('Printing model returns correct string output', () {
    final date = DateFormat('EEE, MMM d, ' 'yyyy').format(DateTime.now());
    final url = 'FAKE';
    final quantity = '1';
    final latitude = '2';
    final longitude = '3';

    final wasteEntry = WasteEntry(
        date: date,
        imageURL: url,
        quantity: quantity,
        latitude: latitude,
        longitude: longitude);

    expect(wasteEntry.printEntry(),
        'date: $date, imageURL: $url, quantity: $quantity, latitude: $latitude, longitude: $longitude');
  });
}
