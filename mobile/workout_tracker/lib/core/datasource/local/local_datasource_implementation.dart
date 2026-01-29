import 'package:shared_preferences/shared_preferences.dart';

import 'local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  SharedPreferences sharedPreferences;

  LocalDatasourceImpl(this.sharedPreferences);

}