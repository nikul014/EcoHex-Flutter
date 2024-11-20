import 'package:flutter/foundation.dart';

class LogsCommonUtils {
  static writeToLogFile(String msg, {String? title}) async {
    if (kDebugMode) {
      // print("$title: $msg");
    }
    // if (kDebugMode) {
    //   try {
    //     final directory = await getApplicationDocumentsDirectory();
    //
    //     final path = directory.path;
    //     var file = File('$path/logsFile.txt');
    //     bool isFileExists = await file.exists();
    //     if (!isFileExists) {
    //       await file.create();
    //     }
    //     print('This is the write to log file ${file.path} ${isFileExists}');
    //     print('This is Create Log file ${DateTime.now()} => $title: $msg');
    //     // Write the file
    //     file.writeAsStringSync('\n${DateTime.now()} => $title: $msg',
    //         mode: FileMode.append);
    //   } catch (e) {
    //     print(' This is error occurred $e');
    //   }
    // }
    //
    //  Add below lines to info.plist for showing log file in front end
    //  <key>LSSupportsOpeningDocumentsInPlace</key>
    //     <true/>
    //     <key>UIFileSharingEnabled</key>
    //     <true/>
    //
  }
}
