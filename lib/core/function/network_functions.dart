//Check Network Connection Function
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../argument/check_connection_arg.dart';
import '../resource/constant_manager.dart';

//Connection Checker Function
Future<CheckConnectionArgs> isThereConnection() async {
  ConnectivityResult connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    final result =
        await InternetAddress.lookup(AppConstantManager.appConnectionTest);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return CheckConnectionArgs(isConnected: true, message: 'Connected');
    } else {
      return CheckConnectionArgs(
          isConnected: false,
          message: 'Please Check Your Internet Connection (Mobile Data)');
    }
  } else if (connectivityResult == ConnectivityResult.wifi) {
    final result =
        await InternetAddress.lookup(AppConstantManager.appConnectionTest);
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return CheckConnectionArgs(isConnected: true, message: 'Connected');
    } else {
      return CheckConnectionArgs(
          isConnected: false,
          message: 'Please Check Your Internet Connection (WIFI)');
    }
  } else {
    return CheckConnectionArgs(
        //TODO:Make isConnected Filed False Value When Make Relase Version
        //Because While Debugging In S/Emulator The Internet Connection Blocked If It's False
        isConnected: false,
        message: 'Please Turn On Wifi Or Mobile Data');
  }
}
