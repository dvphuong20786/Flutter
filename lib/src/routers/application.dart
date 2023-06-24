import 'package:shared_preferences/shared_preferences.dart';

import '../utils/api.dart';
import '../utils/shared_preferences.dart';
import '../utils/toastify.dart';

class Application {
  static API api = API();
  static SpUtil? sharePreference;
  static Toastify toastify = Toastify();

}
