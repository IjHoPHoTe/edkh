import 'package:shared_preferences/shared_preferences.dart';

Future getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('token');
}
