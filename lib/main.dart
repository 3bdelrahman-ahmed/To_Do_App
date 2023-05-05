import 'package:flutter/material.dart';
import 'package:to_do_app/Src/rootapp.dart';

import 'Services/Sp_services/cashe_helper.dart';

Future<void>  main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await SharedPreferencesHelper.init();
  runApp(RootApp());
}