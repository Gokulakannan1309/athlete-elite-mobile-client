// import 'package:athlete_elite/app/constants/app_colors.dart';
// import 'package:athlete_elite/app/constants/app_config.dart';
// import 'package:athlete_elite/app/data/providers/api_result.dart';
// import 'package:athlete_elite/app/routes/app_routes.dart';
// import 'package:athlete_elite/app/routes/navigation_helper.dart';
// import 'package:athlete_elite/app/services/network_service.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// bool _hasToJsonMethod(dynamic data) {
//   try {
//     final dynamic json = (data as dynamic).toJson();
//     return json is Map<String, dynamic>;
//   } catch (_) {
//     return false;
//   }
// }

// /// Optional interface (you can use this if you want compile-time safety)
// abstract class JsonEncodable {
//   Map<String, dynamic> toJson();
// }

// class ApiProvider extends GetxService {
//   late Dio dio;
//   String? _accessToken;

//   @override
//   void onInit() {
//     super.onInit();

//     dio = Dio(
//       BaseOptions(
//         baseUrl: AppConfig.appdevBaseUrl,
//         connectTimeout: const Duration(seconds: 10),
//         receiveTimeout: const Duration(seconds: 10),
//         headers: {'Content-Type': 'application/json'},
//       ),
//     );

//     _setupInterceptors();
//   }

//   /// Set token (call this after successful login)
//   void setAccessToken(String? token) {
//     _accessToken = token;
//   }

//   /// Add interceptors for token and error handling
//   void _setupInterceptors() {
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           // Check internet
//           if (!await NetworkService.isConnectedNow()) {
//             NetworkService.showNoInternetScreen();
//             return handler.reject(
//               DioException(
//                 requestOptions: options,
//                 error: 'No Internet Connection',
//                 type: DioExceptionType.unknown,
//               ),
//             );
//           }

//           if (_accessToken != null && _accessToken!.isNotEmpty) {
//             options.headers['Authorization'] = 'Bearer $_accessToken';
//           }

//           return handler.next(options);
//         },
//         onResponse: (response, handler) {
//           if ((response.data is Map &&
//               (response.data['message']?.toString().contains('expired') ??
//                   false))) {
//             _handleUnauthorized();
//             return;
//           }

//           if (response.data is Map) {
//             final status = response.data['status'];
//             if (status == false || status == 'false') {
//               final msg = response.data['message'] ?? 'Something went wrong';
//               ToastHelper.showWarning(msg.toString());
//             }
//           }

//           return handler.next(response);
//         },
//         onError: (DioException e, handler) {
//           // Extract a clean message
//           final msg = e.response?.data?['message'] ??
//               e.message ??
//               'Something went wrong';

//           // Show global toast for every error
//           ToastHelper.showError(msg);

//           return handler.next(e);
//         },
//       ),
//     );
//   }

//   void _handleUnauthorized() {
//     _accessToken = null;
//     ToastHelper.showError('Session expired. Please log in again.');
//     NavigationHelper.toNamed(
//       AppRoutes.login,
//       arguments: {'isAthlete': false},
//       transition: Transition.rightToLeft,
//     );
//   }

//   Future<ApiResult> get(
//     String endpoint, {
//     Map<String, dynamic>? query,
//     RxBool? isLoading,
//   }) async {
//     try {
//       isLoading?.value = true;
//       final response = await dio.get(endpoint);
//       final responseStatus = response.data['status'];
//       if (responseStatus) {
//         return ApiResult.success(
//           data: response.data,
//           message: response.data['message'] ?? 'Success',
//           statusCode: response.statusCode,
//         );
//       } else {
//         return ApiResult.failure(
//           error: response.data,
//           message: response.data['message'] ?? 'Error',
//           statusCode: response.statusCode,
//         );
//       }
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     } catch (e) {
//       return ApiResult.failure(message: 'Unexpected error', error: e);
//     } finally {
//       isLoading?.value = false;
//     }
//   }

//   Future<ApiResult> post(
//     String endpoint,
//     // Map<String, dynamic> data, {
//     dynamic data, {
//     RxBool? isLoading,
//   }) async {
//     try {
//       isLoading?.value = true;
//       late final Map<String, dynamic> requestBody;

//       if (data is Map<String, dynamic>) {
//         requestBody = data;
//       } else if (data is JsonEncodable) {
//         requestBody = data.toJson();
//       } else if (_hasToJsonMethod(data)) {
//         requestBody = (data as dynamic).toJson() as Map<String, dynamic>;
//       } else {
//         throw ArgumentError('Invalid request body type: ${data.runtimeType}');
//       }
//       final response = await dio.post(endpoint, data: requestBody);
//       final responseStatus = response.data['status'];
//       if (responseStatus) {
//         return ApiResult.success(
//           data: response.data,
//           message: response.data['message'] ?? 'Success',
//           statusCode: response.statusCode,
//         );
//       } else {
//         return ApiResult.failure(
//           error: response.data,
//           message: response.data['message'] ?? 'Error',
//           statusCode: response.statusCode,
//         );
//       }
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     } catch (e) {
//       return ApiResult.failure(message: 'Unexpected error', error: e);
//     } finally {
//       isLoading?.value = false;
//     }
//   }

//   Future<ApiResult> put(
//     String endpoint,
//     dynamic data, {
//     RxBool? isLoading,
//   }) async {
//     try {
//       isLoading?.value = true;
//       late final Map<String, dynamic> requestBody;

//       if (data is Map<String, dynamic>) {
//         requestBody = data;
//       } else if (data is JsonEncodable) {
//         requestBody = data.toJson();
//       } else if (_hasToJsonMethod(data)) {
//         requestBody = (data as dynamic).toJson() as Map<String, dynamic>;
//       } else {
//         throw ArgumentError('Invalid request body type: ${data.runtimeType}');
//       }
//       final response = await dio.put(endpoint, data: requestBody);
//       final responseStatus = response.data['status'];
//       if (responseStatus) {
//         return ApiResult.success(
//           data: response.data,
//           message: response.data['message'] ?? 'Updated successfully',
//           statusCode: response.statusCode,
//         );
//       } else {
//         return ApiResult.failure(
//           error: response.data,
//           message: response.data['message'] ?? 'Updated failed',
//           statusCode: response.statusCode,
//         );
//       }
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     } catch (e) {
//       return ApiResult.failure(message: 'Unexpected error', error: e);
//     } finally {
//       isLoading?.value = false;
//     }
//   }

//   Future<ApiResult> delete(String endpoint, {RxBool? isLoading}) async {
//     try {
//       isLoading?.value = true;
//       final response = await dio.delete(endpoint);
//       final responseStatus = response.data['status'];
//       if (!responseStatus) {
//         return ApiResult.failure(
//           error: response.data,
//           message: response.data['message'] ?? 'Delete failed',
//           statusCode: response.statusCode,
//         );
//       }
//       return ApiResult.success(
//         data: response.data,
//         message: response.data['message'] ?? 'Deleted successfully',
//         statusCode: response.statusCode,
//       );
//     } on DioException catch (e) {
//       return _handleDioError(e);
//     } catch (e) {
//       return ApiResult.failure(message: 'Unexpected error', error: e);
//     } finally {
//       isLoading?.value = false;
//     }
//   }

//   ApiResult _handleDioError(DioException e) {
//     final message =
//         e.response?.data?['message'] ?? e.message ?? 'Something went wrong';
//     final statusCode = e.response?.statusCode;
//     return ApiResult.failure(
//       message: message,
//       statusCode: statusCode,
//       error: e.error,
//     );
//   }
// }

// class ToastHelper {
//   static void showError(String message) {
//     Get.snackbar(
//       "Error",
//       message,
//       backgroundColor: Colors.redAccent,
//       colorText: AppColors.black,
//     );
//   }

//   static void showWarning(String message) {
//     Get.snackbar(
//       "Warning",
//       message,
//       backgroundColor: AppColors.primaryColor,
//       colorText: AppColors.black,
//     );
//   }
// }

import 'package:athlete_elite/app/constants/app_colors.dart';
import 'package:athlete_elite/app/constants/app_config.dart';
import 'package:athlete_elite/app/data/providers/api_result.dart';
import 'package:athlete_elite/app/routes/app_routes.dart';
import 'package:athlete_elite/app/routes/navigation_helper.dart';
import 'package:athlete_elite/app/services/network_service.dart';
import 'package:athlete_elite/app/utils/app_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:hive/hive.dart';

bool _hasToJsonMethod(dynamic data) {
  try {
    final dynamic json = (data as dynamic).toJson();
    return json is Map<String, dynamic>;
  } catch (_) {
    return false;
  }
}

/// Optional interface for type safety
abstract class JsonEncodable {
  Map<String, dynamic> toJson();
}

class ApiProvider extends GetxService {
  late Dio dio;
  String? _accessToken;

  @override
  void onInit() {
    super.onInit();
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.appdevBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _setupInterceptors();
    _loadAccessToken();
  }

  /// 🔐 Load access token from Hive
  Future<void> _loadAccessToken() async {
    final tokenBox = await Hive.openBox('auth_token');
    _accessToken = tokenBox.get('access_token');
  }

  /// 🔐 Set and save access token (use this after login)
  Future<void> setAccessToken(String? token) async {
    _accessToken = token;
    final tokenBox = await Hive.openBox('auth_token');
    await tokenBox.put('access_token', token);
    AppLogger.d('Saved access token: $_accessToken');
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // 🌐 Internet connectivity check
          if (!await NetworkService.isConnectedNow()) {
            NetworkService.showNoInternetScreen();
            return handler.reject(
              DioException(
                requestOptions: options,
                error: 'No Internet Connection',
                type: DioExceptionType.unknown,
              ),
            );
          }

          // 🔑 Attach Bearer token from memory or Hive
          if (_accessToken == null || _accessToken!.isEmpty) {
            final tokenBox = await Hive.openBox('auth_token');
            _accessToken = tokenBox.get('access_token');
          }

          if (_accessToken != null && _accessToken!.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }

          return handler.next(options);
        },
        onResponse: (response, handler) async {
          final data = response.data;

          print("response.data is $data");

          if (data is Map &&
              (data['message']
                      ?.toString()
                      .toLowerCase()
                      .contains('Invalid session. Please login again.') ??
                  false)) {
            AppLogger.d("Token expired");
            await _handleUnauthorized();

            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                error: "Token expired",
                type: DioExceptionType.badResponse,
              ),
            );
          }
          // Global warning toast for failed status
          if (response.data is Map) {
            final status = response.data['status'];
            if (status == false || status == 'false') {
              final msg = response.data['message'] ?? 'Something went wrong';
              AppLogger.d("the message is $msg");
              ToastHelper.showWarning(msg.toString());
            }
          }

          return handler.next(response);
        },
        onError: (DioException e, handler) {
          final msg = e.response?.data?['message'] ??
              e.message ??
              'Something went wrong';
          ToastHelper.showError(e.requestOptions.path);
          return handler.next(e);
        },
      ),
    );
  }

  Future<void> _handleUnauthorized() async {
    _accessToken = null;

    final tokenBox = await Hive.openBox('auth_token');
    await tokenBox.delete('access_token');

    ToastHelper.showError('Session expired. Please log in again.');

    // Close any dialogs/loaders before navigating
    if (Get.isDialogOpen == true) Get.back();
    if (Get.isBottomSheetOpen == true) Get.back();

    // Navigation MUST run after current frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.offAllNamed(
        AppRoutes.login,
        arguments: {'isAthlete': true},
      );
    });
  }

  dynamic _prepareRequestBody(dynamic data) {
    if (data == null) return {};

    if (data is FormData) {
      return data;
    }

    if (data is Map || data is List) {
      return data;
    }

    // Map JSON
    if (data is Map<String, dynamic>) {
      AppLogger.d("📦 Request Body (Map): $data");
      return data;
    }

    // Model with toJson() manually
    if (data is JsonEncodable) {
      final json = data.toJson();
      AppLogger.d("📦 Request Body (JsonEncodable): $json");
      return json;
    }

    // Dynamic toJson() (reflection)
    if (_hasToJsonMethod(data)) {
      final json = (data as dynamic).toJson();
      AppLogger.d("📦 Request Body (toJson detected): $json");
      return json;
    }

    // Raw json string
    if (data is String) {
      AppLogger.d("📦 Request Body (Raw String): $data");
      return data;
    }

    throw ArgumentError(
      "❌ Invalid request body type: ${data.runtimeType}. Allowed: Map, FormData, Model.toJson(), String",
    );
  }

  Future<ApiResult> patch(
    String endpoint,
    dynamic data, {
    RxBool? isLoading,
  }) async {
    try {
      isLoading?.value = true;

      final requestBody = _prepareRequestBody(data);

      final response = await dio.patch(endpoint, data: requestBody);

      final success = response.data['status'];

      if (success == true) {
        return ApiResult.success(
          data: response.data,
          message: response.data['message'] ?? 'Updated successfully',
          statusCode: response.statusCode,
        );
      }

      return ApiResult.failure(
        error: response.data,
        message: response.data['message'] ?? 'Update failed',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(message: 'Unexpected error', error: e);
    } finally {
      isLoading?.value = false;
    }
  }

  Future<ApiResult> get(
    String endpoint, {
    Map<String, dynamic>? query,
    RxBool? isLoading,
  }) async {
    try {
      isLoading?.value = true;
      final response = await dio.get(endpoint, queryParameters: query);
      AppLogger.d("response.data is ${response.data}");
      final responseStatus = response.data['status'];
      if (response.statusCode == 401) {
        await _handleUnauthorized();
        return ApiResult.failure(
            message: 'Unauthorized', error: 'Unauthorized');
      }
      if (responseStatus) {
        return ApiResult.success(
          data: response.data,
          message: response.data['message'] ?? 'Success',
          statusCode: response.statusCode,
        );
      } else {
        return ApiResult.failure(
          error: response.data,
          message: response.data['message'] ?? 'Error',
          statusCode: response.statusCode,
        );
      }
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(message: 'Unexpected error', error: e);
    } finally {
      isLoading?.value = false;
    }
  }

  Future<ApiResult> post(
    String endpoint,
    dynamic data, {
    RxBool? isLoading,
  }) async {
    try {
      isLoading?.value = true;

      // final requestBody = _prepareRequestBody(data);

      // final response = await dio.post(endpoint, data: requestBody);
      dynamic requestBody = data;

      if (data is! FormData) {
        requestBody = _prepareRequestBody(data);
      }

      final response = await dio.post(endpoint, data: requestBody);

      final status = response.data['status'];

      if (response.statusCode == 401) {
        await _handleUnauthorized();
      }

      return status == true
          ? ApiResult.success(
              data: response.data,
              message: response.data['message'] ?? 'Success',
              statusCode: response.statusCode,
            )
          : ApiResult.failure(
              error: response.data,
              message: response.data['message'] ?? 'Error',
              statusCode: response.statusCode,
            );
    } on DioException catch (e) {
      return _handleDioError(e);
    } finally {
      isLoading?.value = false;
    }
  }

  Future<ApiResult> put(
    String endpoint,
    dynamic data, {
    RxBool? isLoading,
  }) async {
    try {
      isLoading?.value = true;

      final requestBody = _prepareRequestBody(data);

      final response = await dio.put(endpoint, data: requestBody);
      final status = response.data['status'];

      return status == true
          ? ApiResult.success(
              data: response.data,
              message: response.data['message'] ?? 'Updated successfully',
              statusCode: response.statusCode,
            )
          : ApiResult.failure(
              error: response.data,
              message: response.data['message'] ?? 'Update failed',
              statusCode: response.statusCode,
            );
    } on DioException catch (e) {
      return _handleDioError(e);
    } finally {
      isLoading?.value = false;
    }
  }

  Future<ApiResult> delete(
    String endpoint, {
    RxBool? isLoading,
    dynamic data,
  }) async {
    try {
      isLoading?.value = true;
      final requestBody = _prepareRequestBody(data);
      final response = await dio.delete(endpoint, data: requestBody);
      final responseStatus = response.data['status'];
      if (!responseStatus) {
        return ApiResult.failure(
          error: response.data,
          message: response.data['message'] ?? 'Delete failed',
          statusCode: response.statusCode,
        );
      }
      return ApiResult.success(
        data: response.data,
        message: response.data['message'] ?? 'Deleted successfully',
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(message: 'Unexpected error', error: e);
    } finally {
      isLoading?.value = false;
    }
  }

  /// ⚙️ Handle Dio errors uniformly
  ApiResult _handleDioError(DioException e) {
    final message =
        e.response?.data?['message'] ?? e.message ?? 'Something went wrong';
    final statusCode = e.response?.statusCode;
    return ApiResult.failure(
      message: message,
      statusCode: statusCode,
      error: e.error,
    );
  }
}

class ToastHelper {
  static void showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: Colors.redAccent,
      colorText: AppColors.black,
    );
  }

  static void showWarning(String message) {
    Get.snackbar(
      "Warning",
      message,
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.black,
    );
  }
}
