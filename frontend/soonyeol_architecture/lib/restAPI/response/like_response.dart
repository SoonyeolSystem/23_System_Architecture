class LikeResponse {
  final String message;
  final String statusCode;

  LikeResponse({required this.message,required this.statusCode});

  factory LikeResponse.fromJson(Map<String, dynamic> json) {
    return LikeResponse(
      message: json['message'] ?? '',
            statusCode: json['statusCode'] ?? '',

    );
  }
}