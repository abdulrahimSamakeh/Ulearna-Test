import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

import 'api_url.dart';

//All Api methods with configuration to send http request
class ApiMethods {
  late Map<String, String> headers;
  final bool? isSecondBaseUrl;
  ApiMethods({Map<String, String>? header, this.isSecondBaseUrl}) {
    if (header == null) {
      headers = {
        "Content-type": "application/json",
        "Accept": "application/json",
      };
    } else {
      headers = header;
    }
  }

  //Filter Map From Incorrect Or Empty Values Function
  //with deafult value for each data type
  Map<String, dynamic> filterRequest(Map<String, dynamic> inputMap) {
    final filteredMap = inputMap
      ..removeWhere((key, value) =>
          value == null ||
          value == DateTime(0) ||
          value == '' ||
          value == -1 ||
          value == {} ||
          value == '{}' ||
          value is Map && value.isEmpty ||
          value == "0000-01-01" ||
          value == [] ||
          value == "0000-01-0");
    //Looping To Check Also The Objeccts Inside The Request
    filteredMap.forEach(
      (key, value) {
        if (value is Map<String, dynamic>) {
          filterRequest(value);
          filteredMap[key] = filterRequest(value);
        }
      },
    );
    return filteredMap;
  }

  //Using this function for all get requests
  //When the parameter does not needed set as empty value
  Future<http.Response> get(
      {required String url,
      Map<String, dynamic>? path,
      Map<String, dynamic>? query}) async {
    if (query != null) {
      query = filterRequest(query);
    }
    if (path != null) {
      path = filterRequest(path);
    }
    if (path != null && query != null && query.isNotEmpty && path.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getPath(path)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else if (query != null && query.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else if (path != null && path.isNotEmpty) {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getPath(path)
              .getLink(),
          headers: headers);
    } else {
      return await http.get(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          headers: headers);
    }
  }

  //Using this function for all post requests
  //When the parameter does not needed set as empty value
  Future<http.Response> post(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? query}) async {
    if (query != null) {
      query = filterRequest(query);
    }

    if (body != null) {
      body = filterRequest(body);
    }
    // ignore: unnecessary_null_comparison
    if (body != null && query != null && query.isNotEmpty) {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          body: jsonEncode(body),
          headers: headers);
    } else if (query != null && query.isNotEmpty) {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          headers: headers);
    } else {
      return await http.post(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          body: jsonEncode(body),
          headers: headers);
    }
  }

  //Using this function for all pu requests
  //When the parameter does not needed set as empty value
  Future<http.Response> put(
      {required String url, body, required Map<String, dynamic> query}) async {
    query = filterRequest(query);
    if (query.isEmpty) {
      return await http.put(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
          body: jsonEncode(body),
          headers: headers);
    } else {
      return await http.put(
          ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl)
              .getQuery(query)
              .getLink(),
          body: jsonEncode(body),
          headers: headers);
    }
  }

  //Using this function for all delete requests
  //When the parameter does not needed set as empty value
  Future<http.Response> delete({required String url, required path}) async {
    return await http.delete(
        ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink(),
        headers: headers);
  }

  //Multi Part http call function
  Future<http.Response> multipartRequest(
      {required String url,
      required Map<String, dynamic> fields,
      required Map<String, File> files,
      required String methodName}) async {
    var request = http.MultipartRequest(
        methodName, ApiUrl(url, useSecondBaseUrl: isSecondBaseUrl).getLink());

    request.headers.addAll(headers);

    var filterdFiles = filterRequest(fields);

    // Add fields
    filterdFiles.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    // Add files
    files.forEach((key, file) async {
      var multipartFile = await http.MultipartFile.fromPath(
        key,
        file.path,
        contentType: MediaType.parse(lookupMimeType(file.path)!),
      );
      request.files.add(multipartFile);
    });

    // Send the request and get the response
    var response = await request.send();

    // Return the response
    return await http.Response.fromStream(response);
  }
}
