class ApiResult<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;
  final dynamic error;

  ApiResult({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
    this.error,
  });

  /// Factory for success response
  factory ApiResult.success({T? data, String? message, int? statusCode}) {
    return ApiResult(
      success: true,
      message: message ?? 'Success',
      data: data,
      statusCode: statusCode,
    );
  }

  /// Factory for failure response
  factory ApiResult.failure({String? message, int? statusCode, dynamic error}) {
    return ApiResult(
      success: false,
      message: message ?? 'Something went wrong',
      statusCode: statusCode,
      error: error,
    );
  }

  /// Generic JSON parser
  factory ApiResult.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResult(
      success: json['status'] == true,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      statusCode: json['statusCode'],
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T value)? toJsonT) {
    return {
      'status': success,
      'message': message,
      'data': data != null && toJsonT != null ? toJsonT(data as T) : data,
      'statusCode': statusCode,
      'error': error,
    };
  }

  @override
  String toString() {
    return 'ApiResult(success: $success, message: $message, statusCode: $statusCode, data: $data, error: $error)';
  }
}
