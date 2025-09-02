class ApiResponse {
  bool? success = false;
  int? statusCode = 200;
  String? message = "";
  dynamic data;

  ApiResponse({this.data, this.success, this.message, this.statusCode});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['response_code'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    map['status'] = statusCode;
    map['message'] = message;
    map['data'] = data;
    return data;
  }
}
