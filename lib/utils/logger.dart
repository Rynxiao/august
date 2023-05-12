import 'package:logger/logger.dart' as third_logger;

class Logger {
  static final logger = third_logger.Logger(
    level: third_logger.Level.verbose,
    printer: third_logger.PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
    ),
  );

  static void v(dynamic message) {
    logger.v(message);
  }

  static void i(dynamic message) {
    logger.i(message);
  }

  static void d(dynamic message) {
    logger.d(message);
  }

  static void e(dynamic message) {
    logger.e(message);
  }
}