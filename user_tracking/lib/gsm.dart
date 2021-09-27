import 'dart:convert';

List<Gsm> gsmFromJson(String str) =>
    List<Gsm>.from(json.decode(str).map((x) => Gsm.fromJson(x)));

String gsmToJson(List<Gsm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gsm {
  Gsm({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.latitude,
    required this.longitude,
  });

  String id;
  String manufacturer;
  String model;
  String latitude;
  String longitude;

  factory Gsm.fromJson(Map<String, dynamic> json) => Gsm(
        id: json["id"],
        manufacturer: json["manufacturer"],
        model: json["model"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "manufacturer": manufacturer,
        "model": model,
        "latitude": latitude,
        "longitude": longitude,
      };
}
