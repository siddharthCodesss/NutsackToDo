import 'dart:collection';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:nutsacktodo/app/apis/app_exceptions.dart';
import 'package:nutsacktodo/app/apis/response/api_response.dart';
import 'package:nutsacktodo/app/base/constants/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../base/constants/api_constants.dart';
import '../../base/constants/preference_key_constants.dart';
import '../../base/utils/preference_utils.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseURL,
      responseType: ResponseType.json,
      connectTimeout: Duration(milliseconds: 20000),
      receiveTimeout: Duration(milliseconds: 20000),
    );
    _dio = Dio(options);
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future<dynamic> get(apiName,
      {body, header, option, bool externalUrl = false}) async {
    Response responseJson;
    Map<String, dynamic> headers = HashMap();

    headers = await getHeaders();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "get");
      option.headers = headers;
    }

    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(
          ApiResponse(
              message:
                  "No internet connection. Please check your internet connection",
              statusCode: 100),
        );
      }

      late Response response;

      if (externalUrl) {
        print(apiName);

        _dio.options.baseUrl = apiName;

        response = await _dio.request('', data: body, options: option);

        print(response);

        _dio.options.baseUrl = 'RemoteDataSource.BASE_URL';
      } else {
        response = await _dio.request(apiName, data: body, options: option);
      }

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
      /* else if (e.response!.statusCode == AppConstants.unauthorisedErrorCode) {
        Response response = await _dio
            .post(
          ApiEndPoints.apiRefreshTokenEndPoint,
          data: ReqRefreshTokenModel(
              refreshToken:
              getString(PreferenceKeyConstants.prefKeyRefreshToken))
              .toJson(),
          queryParameters: null,
          options: null,
        )
            .catchError((onError) async {
          _logOutUser();
        });
        ResRefreshTokenModel model =
        ResRefreshTokenModel.fromJson(response.data);
        setString(
            PreferenceKeyConstants.prefKeyToken, model.result!.accessToken!);
        setString(PreferenceKeyConstants.prefKeyRefreshToken,
            model.result!.refreshToken!);
        return await (_dio.post(
          endUrl,
          data: data,
          queryParameters: params,
          options: options,
        ));
      }*/
      rethrow;
    }
  }

  Future<dynamic> post(apiName, {body, header, option}) async {
    Response responseJson;
    Map<String, dynamic> headers = HashMap();
    headers = await getHeaders();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "post");
      option.headers = headers;
    }

    try {
      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(
          ApiResponse(
              message:
                  "No internet connection. Please check your internet connection",
              statusCode: 100),
        );
      }

      Response response =
          await _dio.request(apiName, data: body, options: option);

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
    }
  }

  Future<dynamic> postFile(String apiName, File fileToUpload) async {
    try {
      Response responseJson;
      Map<String, dynamic> headers = HashMap();

      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(
          ApiResponse(
              message:
                  "No internet connection. Please check your internet connection",
              statusCode: 100),
        );
      }

      headers['Content-Encoding'] = "application/gzip";

      var option = Options(method: "post");
      option.headers = headers;

      String fileName = fileToUpload.path.split('/').last;

      FormData formData = FormData.fromMap({
        "file":
            await MultipartFile.fromFile(fileToUpload.path, filename: fileName),
      });

      var url = 'RemoteDataSource.BASE_URL' + '/files/upload/multiple';

      Response response =
          await _dio.request(url, data: formData, options: option);

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
      /* else if (e.response!.statusCode == AppConstants.unauthorisedErrorCode) {
        Response response = await _dio
            .post(
          ApiEndPoints.apiRefreshTokenEndPoint,
          data: ReqRefreshTokenModel(
              refreshToken:
              getString(PreferenceKeyConstants.prefKeyRefreshToken))
              .toJson(),
          queryParameters: null,
          options: null,
        )
            .catchError((onError) async {
          _logOutUser();
        });
        ResRefreshTokenModel model =
        ResRefreshTokenModel.fromJson(response.data);
        setString(
            PreferenceKeyConstants.prefKeyToken, model.result!.accessToken!);
        setString(PreferenceKeyConstants.prefKeyRefreshToken,
            model.result!.refreshToken!);
        return await (_dio.post(
          endUrl,
          data: data,
          queryParameters: params,
          options: options,
        ));
      }*/
      rethrow;
    }
  }

  Future<dynamic> postFiles(String apiName, List<File> filesToUpload) async {
    try {
      Response responseJson;
      Map<String, dynamic> headers = HashMap();

      var isConnected = await checkInternet();
      if (!isConnected) {
        return Future.error(
          ApiResponse(
              message:
                  "No internet connection. Please check your internet connection",
              statusCode: 100),
        );
      }

      headers['Content-Encoding'] = "application/gzip";

      var option = Options(method: "post");
      option.headers = headers;

      var formData = FormData();

      for (var file in filesToUpload) {
        formData.files.addAll([
          MapEntry("file", await MultipartFile.fromFile(file.path)),
        ]);
      }

      var url = 'RemoteDataSource.BASE_URL' + '/files/upload/multiple';

      Response response =
          await _dio.request(url, data: formData, options: option);

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
      /* else if (e.response!.statusCode == AppConstants.unauthorisedErrorCode) {
        Response response = await _dio
            .post(
          ApiEndPoints.apiRefreshTokenEndPoint,
          data: ReqRefreshTokenModel(
              refreshToken:
              getString(PreferenceKeyConstants.prefKeyRefreshToken))
              .toJson(),
          queryParameters: null,
          options: null,
        )
            .catchError((onError) async {
          _logOutUser();
        });
        ResRefreshTokenModel model =
        ResRefreshTokenModel.fromJson(response.data);
        setString(
            PreferenceKeyConstants.prefKeyToken, model.result!.accessToken!);
        setString(PreferenceKeyConstants.prefKeyRefreshToken,
            model.result!.refreshToken!);
        return await (_dio.post(
          endUrl,
          data: data,
          queryParameters: params,
          options: options,
        ));
      }*/
      rethrow;
    }
  }

  Future<dynamic> put(apiName, {body, header, option}) async {
    Response responseJson;
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "put");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
      /* else if (e.response!.statusCode == AppConstants.unauthorisedErrorCode) {
        Response response = await _dio
            .post(
          ApiEndPoints.apiRefreshTokenEndPoint,
          data: ReqRefreshTokenModel(
              refreshToken:
              getString(PreferenceKeyConstants.prefKeyRefreshToken))
              .toJson(),
          queryParameters: null,
          options: null,
        )
            .catchError((onError) async {
          _logOutUser();
        });
        ResRefreshTokenModel model =
        ResRefreshTokenModel.fromJson(response.data);
        setString(
            PreferenceKeyConstants.prefKeyToken, model.result!.accessToken!);
        setString(PreferenceKeyConstants.prefKeyRefreshToken,
            model.result!.refreshToken!);
        return await (_dio.post(
          endUrl,
          data: data,
          queryParameters: params,
          options: options,
        ));
      }*/
      rethrow;
    }
  }

  Future<dynamic> delete(apiName, {body, header, option}) async {
    Response responseJson;
    Map<String, dynamic> headers = HashMap();

    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = Options(method: "delete");
      option.headers = headers;
    }

    try {
      Response response =
          await _dio.request(apiName, data: body, options: option);

      responseJson = _returnResponse(response);
      return responseJson;
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return Future.error(ApiResponse(
            message: AppConstants.somethingWentWrong, statusCode: 100));
      }
      /* else if (e.response!.statusCode == AppConstants.unauthorisedErrorCode) {
        Response response = await _dio
            .post(
          ApiEndPoints.apiRefreshTokenEndPoint,
          data: ReqRefreshTokenModel(
              refreshToken:
              getString(PreferenceKeyConstants.prefKeyRefreshToken))
              .toJson(),
          queryParameters: null,
          options: null,
        )
            .catchError((onError) async {
          _logOutUser();
        });
        ResRefreshTokenModel model =
        ResRefreshTokenModel.fromJson(response.data);
        setString(
            PreferenceKeyConstants.prefKeyToken, model.result!.accessToken!);
        setString(PreferenceKeyConstants.prefKeyRefreshToken,
            model.result!.refreshToken!);
        return await (_dio.post(
          endUrl,
          data: data,
          queryParameters: params,
          options: options,
        ));
      }*/
      rethrow;
    }
  }
}

Future<Map<String, String>> getHeaders() async {
  SPUtil prefs = await SPUtil.getInstance();
  var userToken = prefs.getString(PreferenceKeyConstants.prefKeyToken);
  if (userToken != null) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $userToken'
    };
  } else {
    return {
      'Content-Type': 'application/json',
    };
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

dynamic _returnResponse(Response response) {
  switch (response.statusCode) {
    case 200:
      return response;
    case 400:
      throw BadRequestException(response.data);
    case 401:
    case 403:
      throw UnauthorisedException(response.data);
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

final RestClient restClient = RestClient();
