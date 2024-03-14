import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mypens/features/auth/services/user_type_enum.dart';
import 'dart:convert';
import '../../../../constants/url.dart';
import '../../features/auth/services/user.dart';
import '../../features/auth/services/staffAndLecturer.dart';

class UserController extends ChangeNotifier {

  // Untuk semua user
  String userNama = '';
  UserType userType = UserType.unknown;
  String userEmail = '';
  
  // Khusus untuk mahasiswa
  int idMahasiswa = 0;
  int nrpMahasiswa = 0;

  // Khusus untuk dosen dan staff
  String userNip = '';
  int userNomor = 0;

  void setNip(String nip) {
    userNip = nip;
    getNamaFromNip(nip);
    notifyListeners();
  }

  void setNrp(int id) {
    nrpMahasiswa = id;
    getIdMahasiswaFromNrp(id);
    notifyListeners();
  }

  void setEmail(String email) {
    userEmail = email;
    notifyListeners();
  }

  void setType(UserType userType) => this.userType = userType;

  Future getNamaFromNip(String nip) async {
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "pegawai",
      "data": ["*"],
      "filter": {"nip": nip}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final user = staffAndLecturerFromJson(response.body);
      userNama = user.data.first.nama;
      userNomor = int.parse(user.data.first.nomor);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future getIdMahasiswaFromNrp(int id) async {
    int nrp = id;
    String url = '${dynamicAPIUrl}read';
    Map<String, dynamic> datas = {
      "table": "mahasiswa",
      "data": ["*"],
      "limit": 1,
      "filter": {"nrp": nrp}
    };
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'x-api-key': apiKey
    };
    Uri uri = Uri.parse(url);
    try {
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(datas));
      final user = ResponseOfUserDto.fromJson(response.body);
      idMahasiswa = int.parse(user.data.first.nomor);
      userNama = user.data.first.nama;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  String getEmail() {
    return userEmail;
  }
}
