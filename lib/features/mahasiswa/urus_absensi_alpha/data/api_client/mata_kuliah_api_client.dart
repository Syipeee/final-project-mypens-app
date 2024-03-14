import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:mypens/constants/url.dart';

class MataKuliahApiClient {
  Future<Response> getMataKuliah(int idMahasiswa) async {
    final requestBody = {
      "table": "vmy_kuliah",
      "data": ["*"],
      "filter": {
        "mahasiswa": idMahasiswa
      }
    };
    final header = {
      "x-api-key" : apiKey,
      HttpHeaders.contentTypeHeader : 'application/json'
    };

    return post(
      Uri.parse("${dynamicAPIUrl}read"),
      body: jsonEncode(requestBody),
      headers: header,
    );
  }
}