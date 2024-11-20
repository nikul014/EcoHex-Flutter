import '../../app_singleton.dart';
import '../../utils/secure_storage.dart';
import 'api_endpoints.dart';

class CognitoService {
  // static CognitoUserPool userPool = CognitoUserPool(
  //     APIEndpoints.awsCognitoUserPoolId, APIEndpoints.awsCognitoClientId);
  //
  // static CognitoUserSession? cognitoUserSession;
  //
  // static Future<dynamic> signUp(String email, String username, String password,
  //     String userRole, String birthDay, String fullName) async {
  //   if (!await Utils.checkInternetConnectionAndShowMessage()) {
  //     return;
  //   }
  //   userPool = CognitoUserPool(getUserPoolId(), getClientId());
  //   final userAttribute = [
  //     AttributeArg(name: "email", value: email),
  //     AttributeArg(name: "custom:role", value: userRole),
  //     AttributeArg(name: "custom:birthday", value: birthDay),
  //     AttributeArg(name: "name", value: fullName)
  //   ];
  //   CognitoUserPoolData data;
  //
  //   try {
  //     await SecureStorageUtil.setValue(
  //       key: EncryptedPrefKeys.awsCognitoUserName.name,
  //       value: username,
  //     );
  //     await SecureStorageUtil.setValue(
  //       key: EncryptedPrefKeys.awsCognitoPassword.name,
  //       value: password,
  //     );
  //     await SecureStorageUtil.setValue(
  //       key: EncryptedPrefKeys.awsCognitoUserEmail.name,
  //       value: email,
  //     );
  //
  //     data = await userPool.signUp(username, password,
  //         userAttributes: userAttribute);
  //     Logger.info("Sing up completed  >>>>>>> ${data.user}");
  //     return data.user;
  //   } on CognitoClientException catch (e) {
  //     // Logger.error(" >>>> CognitoClientException ${e.code} <<<<<< ");
  //     // Logger.error(" >>>> Status code ${e.statusCode} <<<<<< ");
  //     if (e.message?.toLowerCase() ==
  //         'PreSignUp failed with error UserAlreadyExists.'.toLowerCase()) {
  //       return 'Email already exists, please try signing in.';
  //     } else if (e.message?.toLowerCase().contains(
  //             'PreSignUp failed with error Uniqueness violation'
  //                 .toLowerCase()) ??
  //         false) {
  //       return 'Username already exists, please try signing in.';
  //     }
  //     return "Something went wrong. Please try again later.";
  //   } on CognitoUserCustomChallengeException catch (e) {
  //     Logger.error(
  //         " >>>>CognitoUserCustomChallengeException ${e.message} <<<<<< ");
  //     return e.message;
  //   } on CognitoUserConfirmationNecessaryException catch (e) {
  //     Logger.error(
  //         " >>>>CognitoUserConfirmationNecessaryException ${e.message} <<<<<< ");
  //     return e.message;
  //   }
  // }
/*
  static getCognitoUser() async {
    return CognitoUser(
      await SecureStorageUtil.getValue(
          key: EncryptedPrefKeys.awsCognitoUserName.name),
      userPool,
    );
  }

  static refreshToken() async {
    try {
      userPool = CognitoUserPool(getUserPoolId(), getClientId());
      CognitoUser user = CognitoUser(
        await SecureStorageUtil.getValue(
            key: EncryptedPrefKeys.awsCognitoUserName.name),
        userPool,
      );
      cognitoUserSession = await user.refreshSession(
        cognitoUserSession?.refreshToken == null
            ? CognitoRefreshToken(await SecureStorageUtil.getValue(
                key: EncryptedPrefKeys.awsUserRefreshToken.name))
            : cognitoUserSession!.refreshToken!,
      );
      await storeIdAndRefreshToken(
        cognitoUserSession!.idToken.jwtToken!,
        cognitoUserSession!.refreshToken!.token!,
      );
      LogsCommonUtils.writeToLogFile('This is cognito user success');
    } on CognitoClientException catch (e) {
      // LogsCommonUtils.writeToLogFile(
      //     'This is cognito user CognitoClientException  ${e}');
      if (e.code == 'NotAuthorizedException') {
        var validSignOut = await CognitoService.signOut();
        if (validSignOut.runtimeType == bool) {
          String userId = AppSingleton.loggedInUserProfile?.id ?? '';
          AppSingleton.loggedInUserProfile = null;
          await UserPreference.clear();
          AppSingleton()
              .subscriptionStateController
              ?.subscriptionStream
              ?.cancel();
          UserPreference.setValue(
              key: SharedPrefKey.isFirstTime.name, value: true);
          UserPreference.setValue(
              key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
          Get.offAllNamed(introductionViewRoute);
        } else {
          AppSingleton.loggedInUserProfile = null;
          await UserPreference.clear();
          AppSingleton()
              .subscriptionStateController
              ?.subscriptionStream
              ?.cancel();
          String userId = AppSingleton.loggedInUserProfile?.id ?? '';
          UserPreference.setValue(
              key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
          Get.offAllNamed(introductionViewRoute);
        }
      }
    } on Exception catch (e) {
      LogsCommonUtils.writeToLogFile('This is cognito user Exception  ${e}');
    }
  }

  static refreshTokenUpdated() async {
    try {
      userPool = CognitoUserPool(getUserPoolId(), getClientId());
      CognitoUser user = CognitoUser(
        await SecureStorageUtil.getValue(
            key: EncryptedPrefKeys.awsCognitoUserName.name),
        userPool,
      );
      LogsCommonUtils.writeToLogFile('This is cognito 123 refresh');
      cognitoUserSession = await user.refreshSession(
        cognitoUserSession?.refreshToken == null
            ? CognitoRefreshToken(await SecureStorageUtil.getValue(
                key: EncryptedPrefKeys.awsUserRefreshToken.name))
            : cognitoUserSession!.refreshToken!,
      );

      LogsCommonUtils.writeToLogFile('This is cognito 123 jwt');
      await storeIdAndRefreshToken(
        cognitoUserSession!.idToken.jwtToken!,
        cognitoUserSession!.refreshToken!.token!,
      );
      LogsCommonUtils.writeToLogFile('This is cognito 123 success');
      return true;
    } on CognitoClientException catch (e) {
      // LogsCommonUtils.writeToLogFile(
      //     'This is cognito 123 CognitoClientException  ${e}');
      if (e.code == 'NotAuthorizedException') {
        var validSignOut = await CognitoService.signOut();
        if (validSignOut.runtimeType == bool) {
          String userId = AppSingleton.loggedInUserProfile?.id ?? '';
          AppSingleton.loggedInUserProfile = null;
          await UserPreference.clear();
          AppSingleton()
              .subscriptionStateController
              ?.subscriptionStream
              ?.cancel();
          UserPreference.setValue(
              key: SharedPrefKey.isFirstTime.name, value: true);
          UserPreference.setValue(
              key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
          // Get.offAllNamed(introductionViewRoute);
        } else {
          String userId = AppSingleton.loggedInUserProfile?.id ?? '';
          AppSingleton.loggedInUserProfile = null;
          await UserPreference.clear();
          AppSingleton()
              .subscriptionStateController
              ?.subscriptionStream
              ?.cancel();
          UserPreference.setValue(
              key: SharedPrefKey.previousLoggedInUserId.name, value: userId);
          Utils.showMessageInSnackBar(validSignOut.toString(), true);
          // Get.offAllNamed(introductionViewRoute);
        }
        Utils.showSessionExpireDialog(message: '');
      }
      return false;
    } on Exception catch (e) {
      LogsCommonUtils.writeToLogFile('This is cognito user Exception  ${e}');
      return false;
    }
  }

  static Future<dynamic> verifyUserDetails(String verificationCode) async {
    if (!await Utils.checkInternetConnectionAndShowMessage()) {
      return;
    }
    final cognitoUser = await getCognitoUser();

    bool registrationConfirmed = false;
    try {
      userPool = CognitoUserPool(getUserPoolId(), getClientId());
      registrationConfirmed =
          await cognitoUser.confirmRegistration(verificationCode);
      if (registrationConfirmed) {
        cognitoUserSession = await signIn(
          username: await SecureStorageUtil.getValue(
              key: EncryptedPrefKeys.awsCognitoUserEmail.name),
          password: await SecureStorageUtil.getValue(
              key: EncryptedPrefKeys.awsCognitoPassword.name),
        ).whenComplete(() async {
          await storeIdAndRefreshToken(
            cognitoUserSession!.idToken.jwtToken!,
            cognitoUserSession!.refreshToken!.token!,
          );
          await GraphQLService().getUserProfile(onSuccess: (val) {});
        });
      }
      return registrationConfirmed;
    } on CognitoClientException catch (e) {
      Logger.error(" >>>> ${e.message} <<<<<< ");
      return e.message;
    }
  }

  static Future<dynamic> resendVerificationCode() async {
    if (!await Utils.checkInternetConnectionAndShowMessage()) {
      return;
    }
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    final cognitoUser = CognitoUser(
        await SecureStorageUtil.getValue(
            key: EncryptedPrefKeys.awsCognitoUserName.name),
        userPool);
    final Map<String, dynamic> status;
    try {
      status = await cognitoUser.resendConfirmationCode();
      Logger.info("Status of resend >>>>> $status");
      return status;
    } on CognitoClientException catch (e) {
      Logger.error(" >>>> ${e.message} <<<<<< ");
      return e.message;
    }
  }

  static Future<dynamic> signIn({String? username, String? password}) async {
    if (!await Utils.checkInternetConnectionAndShowMessage()) {
      return;
    }
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    final cognitoUser = CognitoUser(username!, userPool);
    final authDetails = AuthenticationDetails(
      username: username,
      password: password,
    );
    try {
      cognitoUserSession = await cognitoUser.authenticateUser(authDetails);
      await storeIdAndRefreshToken(
        cognitoUserSession!.idToken.jwtToken!,
        cognitoUserSession!.refreshToken!.token!,
      );
      UserPreference.setValue(key: SharedPrefKey.isLogin.name, value: true);
      return cognitoUserSession;
    } on CognitoClientException catch (e) {
      Logger.error(" CognitoClientException >>>> $e <<<<<< ");
      if (e.message ==
          "PreAuthentication failed with error Merchant account DEACTIVATED.") {
        return 'Your account is deactivated please contact the Merchant admin.';
      } else if (e.message?.toLowerCase() ==
          'PreAuthentication failed with error Your account has been DEACTIVATED.'
              .toLowerCase()) {
        return 'Your account is deactivated please contact the Merchant admin.';
      } else if (e.message?.toLowerCase() ==
          'PreSignUp failed with error UserAlreadyExists.'.toLowerCase()) {
        return 'Email already exists, please try signing in.';
      } else if (e.message?.toLowerCase().contains(
              'PreSignUp failed with error Uniqueness violation'
                  .toLowerCase()) ??
          false) {
        return 'Username already exists, please try signing in.';
      }
      return e.message;
    } on CognitoUserNewPasswordRequiredException catch (e) {
      Logger.error(" CognitoUserNewPasswordRequiredException >>>> $e <<<<<< ");
      return e.message;
    } on CognitoUserMfaRequiredException catch (e) {
      Logger.error(" CognitoUserMfaRequiredException >>>> $e <<<<<< ");
      return e.message;
    } on CognitoUserTotpRequiredException catch (e) {
      Logger.error(" CognitoUserTotpRequiredException >>>> $e <<<<<< ");
      return e.message;
    } on CognitoUserCustomChallengeException catch (e) {
      Logger.error(" CognitoUserCustomChallengeException >>>> $e <<<<<< ");
      return e.message;
    } on CognitoUserConfirmationNecessaryException catch (e) {
      Logger.error(
          " CognitoUserConfirmationNecessaryException >>>> $e <<<<<< ");
      return e.message;
    }
  }

  static CognitoUser getCognitoUserForValidation(String username) {
    final cognitoUser = CognitoUser(username, userPool);
    return cognitoUser;
  }

  static Future<dynamic> resendTheUserConfirmation(
      {String? username, String? email}) async {
    final cognitoUser = CognitoUser(username, userPool);
    try {
      var validateResend = await cognitoUser.resendConfirmationCode();
      final Map<String, dynamic> data = {};
      if (validateResend.runtimeType == data.runtimeType) {
        Utils.showMessageInSnackBar(
            "Verification code has been sent successfully !", false);
        return validateResend['CodeDeliveryDetails']['Destination'];
      } else {
        Utils.showMessageInSnackBar(validateResend.toString(), true);
      }
    } catch (e) {}
  }

  /// request the forgot password
  static Future<dynamic> requestForgotPassword(String? userName) async {
    final cognitoUser = CognitoUser(userName!, userPool);
    Logger.info("This is user name >>>>>>> $userName");
    Logger.info("This is cognito user >>>>>>> ${cognitoUser.username}");
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    var requestForgotData;
    try {
      requestForgotData = await cognitoUser.forgotPassword();
      Logger.info("Requesting forgot password >>>> $requestForgotData");
      return requestForgotData;
    } on CognitoClientException catch (e) {
      Logger.error("Requesting forgot password error >>>>>>> ${e.message}");
      return e.message;
    }
  }

  static Future<dynamic> forgotPassword(
      {String? verificationCode, String? newPassword, String? userName}) async {
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    final cognitoUser = CognitoUser(
      userName!,
      userPool,
    );
    bool passwordConfirmed = false;
    try {
      passwordConfirmed =
          await cognitoUser.confirmPassword(verificationCode!, newPassword!);
      Logger.info("Password changed >>>>>> $passwordConfirmed");
      return passwordConfirmed;
    } on CognitoClientException catch (e) {
      Logger.error("error in forgot password >>>>> ${e.message}");
      return e.message;
    }
  }

  static Future<bool?> changePassword(
      {String? oldPassword, String? newPassword}) async {
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    CognitoUser user = CognitoUser(
      AppSingleton.loggedInUserProfile!.email,
      userPool,
    );
    final authDetails = AuthenticationDetails(
        username: AppSingleton.loggedInUserProfile!.email,
        password: oldPassword);

    user.authenticateUser(authDetails).then((value) async {
      bool passwordConfirmed = false;
      try {
        passwordConfirmed =
            await user.changePassword(oldPassword!, newPassword!);
        Logger.info("Password changed >>>>>> $passwordConfirmed");
      } on CognitoClientException catch (e) {
        Logger.error("error in forgot password >>>>> ${e.message}");
        return e.message;
      }
      return passwordConfirmed;
    });
  }

  static Future deleteAuthUser() async {
    userPool = CognitoUserPool(getUserPoolId(), getClientId());
    final cognitoUser = CognitoUser(
        await SecureStorageUtil.getValue(
            key: EncryptedPrefKeys.awsCognitoUserName.name),
        userPool);
    bool userDeleted = false;
    try {
      userDeleted = await cognitoUser.deleteUser();
      Logger.info("This is an deleted user >>>> $userDeleted");
    } catch (e) {}
  }

  static Future<dynamic> signOut() async {
    final cognitoUser = await getCognitoUser();
    try {
      await cognitoUser.signOut();
      return true;
    } on CognitoClientException catch (e) {
      Logger.error(e.message!);
    }
  }*/

  static storeIdAndRefreshToken(
      String userIdToken, String userRefreshToken) async {
    await SecureStorageUtil.setValue(
      key: EncryptedPrefKeys.awsUserIdToken.name,
      value: userIdToken,
    );
    await SecureStorageUtil.setValue(
      key: EncryptedPrefKeys.awsUserRefreshToken.name,
      value: userRefreshToken,
    );
    if (userIdToken != null) {
      AppSingleton().sessionTimeOutHandler(userIdToken: userIdToken);
    }
  }

  static setUserPoolData({bool isManual = false}) {
    // if (UserPreference.getValue(key: SharedPrefKey.selectedUserType.name) ==
    //     UserType.user.name.toString()) {
    //   if (isManual) {
    //     /// Email
    //     if (APIEndpoints.isProduction) {
    //       //   production
    //       awsCognitoUserPoolId = "us-east-1_BiBHFCTOD";
    //       awsCognitoClientId = "7je8tj6fcl0iki8usu2nhj724h";
    //     } else {
    //       // staging
    //       awsCognitoUserPoolId = "us-east-1_c47yJSPDA";
    //       awsCognitoClientId = "7l6jtknrkqfm4lk0orbivve708";
    //     }
    //     saveCognitoData(
    //         clientId: awsCognitoClientId, userPoolId: awsCognitoUserPoolId);
    //   } else {
    //     /// Social Media
    //     if (APIEndpoints.isProduction) {
    //       // production
    //       awsCognitoClientId = "216mkjsmdd6i1n1473lfubvavh";
    //       awsCognitoUserPoolId = "us-east-1_m4602DIWR";
    //     } else {
    //       // staging
    //       awsCognitoUserPoolId = "us-east-1_5fMnNsYfi";
    //       awsCognitoClientId = "3m6dmha90hjfou3tq53ghf6onq";
    //     }
    //     saveCognitoData(
    //         clientId: awsCognitoClientId, userPoolId: awsCognitoUserPoolId);
    //   }
    // } else if (UserPreference.getValue(key: SharedPrefKey.selectedUserType) ==
    //     UserType.creator.name.toString()) {
    //   if (isManual) {
    //     /// Email
    //     if (APIEndpoints.isProduction) {
    //       //   production
    //       awsCognitoUserPoolId = "us-east-1_BiBHFCTOD";
    //       awsCognitoClientId = "7je8tj6fcl0iki8usu2nhj724h";
    //     } else {
    //       // staging
    //       awsCognitoUserPoolId = "us-east-1_c47yJSPDA";
    //       awsCognitoClientId = "7l6jtknrkqfm4lk0orbivve708";
    //     }
    //     saveCognitoData(
    //         clientId: awsCognitoClientId, userPoolId: awsCognitoUserPoolId);
    //   } else {
    //     /// Social Media
    //     if (APIEndpoints.isProduction) {
    //       // production
    //       awsCognitoClientId = "1cema06dd4nkojds95uqpvuqro";
    //       awsCognitoUserPoolId = "us-east-1_m4602DIWR";
    //     } else {
    //       // staging
    //       awsCognitoClientId = "5teau8pmf3cfmlkgm30op7lmjf";
    //       awsCognitoUserPoolId = "us-east-1_5fMnNsYfi";
    //     }
    //     saveCognitoData(
    //         clientId: awsCognitoClientId, userPoolId: awsCognitoUserPoolId);
    //   }
    // } else {
    //   log("setUserPoolData $isManual  UserType.business",
    //       name: "setUserPoolData");
    //   if (APIEndpoints.isProduction) {
    //     //   production
    //     awsCognitoUserPoolId = "us-east-1_BiBHFCTOD";
    //     awsCognitoClientId = "7je8tj6fcl0iki8usu2nhj724h";
    //   } else {
    //     // staging
    //     awsCognitoUserPoolId = "us-east-1_c47yJSPDA";
    //     awsCognitoClientId = "7l6jtknrkqfm4lk0orbivve708";
    //   }
    //   saveCognitoData(
    //       clientId: awsCognitoClientId, userPoolId: awsCognitoUserPoolId);
    // }
  }
  //
  // static void saveCognitoData({String? clientId, String? userPoolId}) {
  //   UserPreference.setValue(
  //     key: SharedPrefKey.awsCognitoClientId.name,
  //     value: clientId,
  //   );
  //   UserPreference.setValue(
  //     key: SharedPrefKey.awsCognitoUserPoolId.name,
  //     value: userPoolId,
  //   );
  // }

  static String getClientId() {
    return APIEndpoints.awsCognitoClientId;
  }

  static String getUserPoolId() {
    return APIEndpoints.awsCognitoUserPoolId;
  }
}
