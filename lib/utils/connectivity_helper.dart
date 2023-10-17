import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isInternetAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.none) {
    return true;
  } else {
    return false;
  }
}

Future<Stream<ConnectivityResult>> isInternetAvailableStream() async {
  return Connectivity().checkConnectivity().asStream();
}
