import 'package:collection/collection.dart';
import 'package:mypens/common/data/dto/api_response.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/data/api_client/mata_kuliah_api_client.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/data/mapper/mata_kuliah_mapper.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/model/mata_kuliah.dart';
import 'package:mypens/features/mahasiswa/urus_absensi_alpha/domain/repository/i_mata_kuliah_repository.dart';

class MataKuliahRepository implements IMataKuliahRepository {
  final _apiClient = MataKuliahApiClient();
  final _mapper = MataKuliahMapper();

  @override
  Future<ApiResponse<List<MataKuliah>>> getMataKuliahFilteredAsApiResponse({
    required String keyword,
    required int idMahasiswa
  }) async {
    try {
      final response = await _apiClient.getMataKuliah(idMahasiswa);

      if (response.statusCode < 300){
        final listAllMataKuliah = _mapper.getListMataKuliahFromBody(response.body);
        final filteredMataKuliah = listAllMataKuliah.where((matkul) =>
          matkul.namaMatkul.contains(keyword)
        ).sortedBy((matkul) => matkul.namaMatkul).toList();

        return ApiResponseSucceed(data: filteredMataKuliah);
      } else {
        return ApiResponseFailed(exception: Exception(response.body));
      }
    } on Exception catch (e) {
      return ApiResponseFailed(exception: e);
    }
  }

  @override
  Future<List<MataKuliah>> getMataKuliahFiltered({
    required String keyword, 
    required int idMahasiswa
  }) async {
    final apiResponse = await getMataKuliahFilteredAsApiResponse(
        keyword: keyword, idMahasiswa: idMahasiswa
    );
    
    if (apiResponse is ApiResponseSucceed){
      return (apiResponse as ApiResponseSucceed<List<MataKuliah>>).data!;
    }
    throw (apiResponse as ApiResponseFailed).exception!;
  }

}