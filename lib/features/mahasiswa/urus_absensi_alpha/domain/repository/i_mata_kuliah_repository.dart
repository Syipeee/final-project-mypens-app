import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah.dart';

abstract class IMataKuliahRepository {
  Future<ApiResponse<List<MataKuliah>>> getMataKuliahFilteredAsApiResponse({
    required String keyword,
    required int idMahasiswa,
  });
  
  Future<List<MataKuliah>> getMataKuliahFiltered({
    required String keyword,
    required int idMahasiswa,
  });
}