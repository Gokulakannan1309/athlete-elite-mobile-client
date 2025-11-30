import 'dart:convert';

import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 1,
        errorMethodCount: 5,
        lineLength: 50,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
      ),
      output: _LongConsoleOutput());

  static void d(dynamic message) => _logger.d(_formatJsonIfNeeded(message));
  static void i(dynamic message) => _logger.i(_formatJsonIfNeeded(message));
  static void w(dynamic message) => _logger.w(_formatJsonIfNeeded(message));
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);

  static dynamic _formatJsonIfNeeded(dynamic data) {
    try {
      // Already JSON map/list
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }

      // Object with toJson() → use it
      if (data != null && data.toJson is Function) {
        final map = data.toJson();
        return const JsonEncoder.withIndent('  ').convert(map);
      }

      // JSON string → decode & pretty print
      if (data is String) {
        final decoded = jsonDecode(data);
        return const JsonEncoder.withIndent('  ').convert(decoded);
      }
    } catch (_) {
      return data; // not JSON
    }

    return data;
  }
}

class _LongConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      _printLong(line);
    }
  }

  void _printLong(String text) {
    const chunkSize = 800;
    for (var i = 0; i < text.length; i += chunkSize) {
      final chunk = text.substring(
        i,
        i + chunkSize > text.length ? text.length : i + chunkSize,
      );
      print(chunk);
    }
  }
}
