import 'dart:async'; //For StreamController/Stream

// import '../AppSingleton.dart';
// import '../DataHandler/Network/GraphqlService.dart';
// import '../Routing/RouteNames.dart';

class ConnectionStatus {
  //This creates the single instance by calling the `_internal` constructor specified below
  static final ConnectionStatus _singleton = ConnectionStatus._internal();

  ConnectionStatus._internal() {
    // _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  factory ConnectionStatus() {
    return _singleton;
  }

  //This tracks the current connection status
  bool hasConnection = true;

  //This is how we'll allow subscribing to connection changes
  StreamController connectionChangeController = StreamController.broadcast();

  void dispose() {
    connectionChangeController.close();
  }

  static isInternetAvailable() async {
    return true; //await InternetConnectionChecker().hasConnection;
  }

  static bool isInternetPageVisible = false;

  //The test to actually see if there is a connection
  Future<bool> checkConnection({bool fromInternetScreen = false}) async {
    bool previousConnection = hasConnection;
    hasConnection = true;

    // try {
    //   final result = await InternetAddress.lookup('google.com');
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     // if (await InternetConnectionChecker().hasConnection) {
    //     hasConnection = true;
    //     if (isInternetPageVisible) {
    //       await reconnectSubscriptions();
    //       Get.back();
    //     }
    //   } else {
    //     hasConnection = false;
    //     if (!fromInternetScreen) {
    //       Get.toNamed(internetPageViewRoute);
    //     }
    //   }
    // } on SocketException catch (_) {
    //   hasConnection = false;
    //   if (!fromInternetScreen) {
    //     Get.toNamed(internetPageViewRoute);
    //   }
    // }
    //
    // //The connection status changed send out an update to all listeners
    // if (previousConnection != hasConnection) {
    //   connectionChangeController.add(hasConnection);
    // }

    return hasConnection;
  }

  reconnectSubscriptions() async {
    /*
              todo uncomment this if you have subscription in the graphql
    try {
      await GraphQLService.init();
      AppSingleton().subscriptionStateController?.isReconnect.value =
          !(AppSingleton().subscriptionStateController?.isReconnect.value ??
              false);
    } catch (e) {}
     */
  }
}
