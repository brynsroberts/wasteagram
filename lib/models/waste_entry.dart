class WasteEntry {
  String date;
  String imageURL;
  String quantity;
  String latitude;
  String longitude;

  WasteEntry(
      {required this.date,
      required this.imageURL,
      required this.quantity,
      required this.latitude,
      required this.longitude});

  String printEntry() {
    return ('date: $date, imageURL: $imageURL, quantity: $quantity, latitude: $latitude, longitude: $longitude');
  }
}
