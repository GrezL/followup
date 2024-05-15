import 'package:get/get.dart';

class ApiProvider extends GetConnect {

  final String apiKey = '';
  final String baseUrl = 'https://api.openai.com';
  final Duration timeout = Duration(seconds: 30);

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
  }

  ApiProvider() {
    httpClient.baseUrl = baseUrl;
    httpClient.timeout = timeout;
    httpClient.addAuthenticator<dynamic>((request) async {
      request.headers.addAll(_headers());
      return request;
    });
  }

  Future<Response> completions(String body) {
    return post('/v1/chat/completions', body);
  }
}