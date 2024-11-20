import '../../app_singleton.dart';
import '../../controller/base_controller.dart';
import '../../model/profile/user_profile.dart';
import '../../utils/shared_prefs.dart';

class GraphQLService extends BaseController {
  // static late ValueNotifier<GraphQLClient> client;
  // static Link? link;
  // static HttpLink? httpLink;
  // static AuthLink? authLink;

  static Future init() async {
    // var token = await SecureStorageUtil.getValue(
    //     key: EncryptedPrefKeys.awsUserIdToken.name);
    // // AppSingleton().sessionTimeOutHandler(userIdToken: token);
    // Map<String, String> headers = {"Authorization": "Bearer $token"};
    // // log('This is token: $headers');
    // httpLink = HttpLink(APIEndpoints.gqlBaseUrl, defaultHeaders: headers);
    // authLink = AuthLink(getToken: () async {
    //   String? token = await SecureStorageUtil.getValue(
    //       key: EncryptedPrefKeys.awsUserIdToken.name);
    //   if (token.isNullOrEmpty) {
    //     return '';
    //   }
    //   DateTime dateTime = AppSingleton().isTokenTimeout(token!);
    //   Duration difference = dateTime
    //       .subtract(Duration(minutes: AppSingleton.tokenTimeOutMinutes))
    //       .difference(DateTime.now());
    //   LogsCommonUtils.writeToLogFile(
    //       'This is refresh token less than ${difference.inMinutes} $dateTime for token expire',
    //       title: 'SessionTimeOutHandler');
    //   if (difference.inMinutes < AppSingleton.tokenTimeOutMinutes) {
    //     LogsCommonUtils.writeToLogFile(
    //         'This is refresh token less than ${difference.inMinutes} init session happens',
    //         title: 'SessionTimeOutHandler');
    //     await CognitoService.refreshTokenUpdated();
    //     token = await SecureStorageUtil.getValue(
    //         key: EncryptedPrefKeys.awsUserIdToken.name);
    //     LogsCommonUtils.writeToLogFile(
    //         'This was called in auth link with new token',
    //         title: 'Auth Link init');
    //     AppSingleton().subscriptionStateController?.isReconnect.value =
    //         !(AppSingleton().subscriptionStateController?.isReconnect.value ??
    //             false);
    //   } else {
    //     LogsCommonUtils.writeToLogFile(
    //         'This was called in auth link with old token',
    //         title: 'Auth Link init');
    //   }
    //   return "Bearer $token";
    // });
    //
    // link = authLink!.concat(httpLink!);
    // client = ValueNotifier(
    //   GraphQLClient(
    //     link: link!,
    //     cache: GraphQLCache(),
    //   ),
    // );
    // LogsCommonUtils.writeToLogFile('Session time out! and socket disposed!!!',
    //     title: 'init()');
    return Future.value(true);
  }

  Future<void> getUserProfile({Function(dynamic)? onSuccess}) async {
    UserProfile userProfile = UserProfile.fromRawJson(
        '{    "id": "12345",    "full_name": "Oliver Clint",    "email": "oliverclint12@gmail.com",        "phone_number": "+1234567890"    }  ')!;
    String updatedUserProfile = userProfile.toRawJson();
    await UserPreference.setValue(
        key: SharedPrefKey.userProfileData.name, value: updatedUserProfile);
    AppSingleton.loggedInUserProfile = UserProfile.fromRawJson(
      await UserPreference.getValue(key: SharedPrefKey.userProfileData.name) ??
          "",
    );
    onSuccess!(true);
    // try {
    //   await GraphQLService.init();
    //   var client = await GraphQLService.client.getValue();
    //   QueryResult result = await client.query(
    //     QueryOptions(
    //       document: gql(
    //           UserQueries().getUserProfile(await Utils.getUserIdFromToken())),
    //     ),
    //   );
    //   bool hasTokenError = await result.isTokenError(onRefreshed: () {
    //     getUserProfile(onSuccess: onSuccess);
    //   });
    //   if (hasTokenError) return;
    //   if (result.data != null && !result.hasException) {
    //     if (result.data!.containsKey("users_by_pk")) {
    //       UserProfile userProfile =
    //           UserProfile.fromJson(result.data!['users_by_pk']);
    //       String updatedUserProfile = userProfile.toRawJson();
    //       await UserPreference.setValue(
    //           key: SharedPrefKey.userProfileData.name,
    //           value: updatedUserProfile);
    //       AppSingleton.loggedInUserProfile = UserProfile.fromRawJson(
    //         await UserPreference.getValue(
    //                 key: SharedPrefKey.userProfileData.name) ??
    //             "",
    //       );
    //       await AppSingleton().subscriptionStateController?.initWebLink();
    //       await AppSingleton().subscriptionStateController?.userSubscription();
    //       onSuccess!(true);
    //     } else {
    //       await UserPreference.removeKey(
    //           key: SharedPrefKey.userProfileData.name);
    //       AppSingleton.loggedInUserProfile = null;
    //       onSuccess!("User is not enabled.");
    //     }
    //   } else {
    //     await UserPreference.removeKey(key: SharedPrefKey.userProfileData.name);
    //     AppSingleton.loggedInUserProfile = null;
    //     LogsCommonUtils.writeToLogFile(
    //         'This is splash screen error in profile get ${result.exception}');
    //     onSuccess!(false);
    //   }
    // } catch (e) {
    //   await UserPreference.removeKey(key: SharedPrefKey.userProfileData.name);
    //   AppSingleton.loggedInUserProfile = null;
    //   LogsCommonUtils.writeToLogFile(
    //       'This is splash screen error in profile get $e');
    //   onSuccess!(false);
    // }
  }
}
/*
todo if you wanted to track request response during testing make sure which api call are used then use below link

class LoggerLink extends Link {
  @override
  Stream<Response> request(
    Request request, [
    NextLink? forward,
  ]) {
    print("Request Started: ${request.variables} : ${DateTime.now()}");

    Stream<Response> response = forward!(request).map((Response fetchResult) {
      final ioStreamedResponse =
          fetchResult.context.entry<HttpLinkResponseContext>();
      if (kDebugMode) {
        print("Request Ended: ${request.variables} : ${DateTime.now()}");
      }
      return fetchResult;
    }).handleError((error) {
      // throw error;
    });

    return response;
  }

  LoggerLink();
}
*/
