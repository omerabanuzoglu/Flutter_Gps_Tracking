import 'package:gsm/api/api.dart';
import 'package:http/http.dart' as http;

Future postData(String manufacturer, String model, String latitude,
    String longitude) async {
  return await http.post(
    Uri.parse(Api.postGsm),
    body: {
      "manufacturer": manufacturer,
      "model": model,
      "latitude": latitude,
      "longitude": longitude,
    },
  );
}
