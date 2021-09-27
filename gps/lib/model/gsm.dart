import 'dart:convert';

List<Gsm> gsmFromJson(String str) =>
    List<Gsm>.from(json.decode(str).map((x) => Gsm.fromJson(x)));

String gsmToJson(List<Gsm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gsm {
  Gsm({
    required this.id,
    required this.ip,
    required this.imei,
    required this.location,
  });

  String id;
  String ip;
  String imei;
  String location;

  factory Gsm.fromJson(Map<String, dynamic> json) => Gsm(
        id: json["id"],
        ip: json["ip"],
        imei: json["imei"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ip": ip,
        "imei": imei,
        "location": location,
      };
}
