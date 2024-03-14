import 'package:http/http.dart';
import 'package:mypens/common/data/utils/my_pens_http_header.dart';
import 'package:mypens/common/domain/dto/submit_data_perizinan_absensi_dto.dart';
import 'package:mypens/constants/url.dart';

class PerizinanAbsensiApiClient {
  Future<Response> submitData(SubmitDataPerizinanDto data) =>
    post(
      Uri.parse("${dynamicAPIUrl}insert"),
      headers: myPensHeader,
      body: data.toJson(),
    );
}