import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:kanban_board/utils/constants.dart';
import 'package:kanban_board/utils/env.dart';

Map<String, String> buildHeaderTokens({
  bool isLoggedIn = true, // since we dont have a login system
  String? token,
}) {
  final header = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    HttpHeaders.cacheControlHeader: 'no-cache',
    HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Origin': '*',
  };

  token ??= Env.apiKey;

  if (isLoggedIn) {
    header.putIfAbsent(
      HttpHeaders.authorizationHeader,
      () => 'Bearer $token',
    );
  }
  return header;
}

Uri buildUrl(String? endPoint) {
  Uri url;
  if (endPoint?.isNotEmpty ?? false) {
    url = Uri.parse('$baseUrl/$endPoint');
  } else {
    url = Uri.parse(baseUrl);
  }

  log('Final URL: $url');

  return url;
}

Future<http.Response> buildHttpResponse({
  String? endPoint,
  HttpMethod method = HttpMethod.get,
  Map<String, dynamic>? request,
}) async {
  try {
    final headers = buildHeaderTokens();
    final url = buildUrl(endPoint);

    http.Response response;

    if (method == HttpMethod.post) {
      // log('Request: $request');
      log('Request for endpoint $url: $request');

      response =
          await http.post(url, body: jsonEncode(request), headers: headers);
    } else if (method == HttpMethod.delete) {
      response = await http.delete(url, headers: headers);
    } else if (method == HttpMethod.put) {
      response =
          await http.put(url, body: jsonEncode(request), headers: headers);
    } else {
      response = await http.get(url, headers: headers);
    }

    log(
      'Response for $url (${method.name}) '
      '${response.statusCode}: '
      '${response.body}',
    );

    return response;
  } catch (error, stackTrace) {
    log('Error: $error');
    log('Stack Trace: $stackTrace');

    return http.Response(
      jsonEncode({
        'error': error,
        'stackTrace': stackTrace,
        'message': 'Something went wrong',
        'success': false,
      }),
      500,
    );
  }
}

Future<dynamic> handleResponse(http.Response response) async {
  try {
    final dataFromResponse = jsonDecode(response.body);

    log('Dat From Response RunTime Type  ${dataFromResponse.runtimeType}');
    return dataFromResponse;
  } catch (error, stackTrace) {
    log('Error: $error');
    log('Stack Trace: $stackTrace');

    return {
      'error': error,
      'stackTrace': stackTrace,
      'message': 'Something went wrong',
      'success': false,
    };
  }
}

enum HttpMethod {
  get,
  post,
  delete,
  put,
}
