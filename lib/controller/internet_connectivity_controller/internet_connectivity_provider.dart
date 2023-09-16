
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:hotstar/services/internet_connectivty.dart';

class InternetConnectivityProvider extends ChangeNotifier {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final InternetConnectivityServices _connectivityServices =
      InternetConnectivityServices();

  Future getInternetConnectivity(BuildContext context) async {
    _connectivityServices.getConnectivity(context); 
     isDeviceConnected=_connectivityServices .isDeviceConnected;
     isAlertSet=_connectivityServices.isAlertSet;
     subscription=_connectivityServices.subscription;
     
    
  }
  notifyListeners();
}

