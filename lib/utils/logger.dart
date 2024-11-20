import 'package:fimber/fimber.dart';

class Logger {
  static Future<void> init() async {
    var tree = DebugTree();
    tree.colorizeMap["I"] = ColorizeStyle(
        [AnsiStyle(AnsiSelection.foreground, color: AnsiColor.cyan)]);
    tree.colorizeMap["E"] = ColorizeStyle([
      AnsiStyle.bright(AnsiColor.white),
      AnsiStyle.background(AnsiColor.red)
    ]);
    tree.colorizeMap["W"] = ColorizeStyle([
      AnsiStyle.foreground(AnsiColor.black),
      AnsiStyle.background(AnsiColor.yellow)
    ]);
    tree.colorizeMap["D"] =
        ColorizeStyle([AnsiStyle.foreground(AnsiColor.green)]);
    tree.colorizeMap["V"] =
        ColorizeStyle([AnsiStyle.foreground(AnsiColor.blue)]);
    Fimber.plantTree(tree);
  }

  static error(String message, {String? tag, StackTrace? stacktrace}) {
    Fimber.e(message, ex: FimberLog(tag ?? "").tag, stacktrace: stacktrace);
  }

  static info(String message, {String? tag, StackTrace? stacktrace}) {
    Fimber.i(message, ex: FimberLog(tag ?? "").tag, stacktrace: stacktrace);
  }

  static debug(String message, {String? tag, StackTrace? stacktrace}) {
    Fimber.d(message, ex: FimberLog(tag ?? "").tag, stacktrace: stacktrace);
  }

  static warning(String message, {String? tag, StackTrace? stacktrace}) {
    Fimber.w(message, ex: FimberLog(tag ?? "").tag, stacktrace: stacktrace);
  }
}
