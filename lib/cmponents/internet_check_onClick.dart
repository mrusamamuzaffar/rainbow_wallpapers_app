// ignore_for_file: file_names

import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> getInternetUsingInternetConnectivity() async {
  bool result = await InternetConnectionChecker().hasConnection;
  return result;
}