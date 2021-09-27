import 'package:http/http.dart' as http;
import 'package:user_tracking/gsm.dart';

Future<List<Gsm>> fetchUser() async {
  var url = "https://kargaliinsaat.com/study/gsm/select.php";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return gsmFromJson(response.body);
  } else {
    throw ("Veri Yüklenemedi!");
  }
}
