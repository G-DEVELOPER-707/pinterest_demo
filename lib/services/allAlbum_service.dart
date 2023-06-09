import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../core/api.dart';
import '../core/dio.dart';
import '../models/allAlbum.model.dart';
import '../utils/log_service/log_service.dart';

class AllAlbumService {
  static Future<Either<String, List<AllPhotoModel>>> getCarAlbum(int page) async {
    try {
      Response response = await Dio().get( '${Endpoints.getPhotos}?page=$page&per_page=50&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          }));
      Log.w(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<AllPhotoModel> carAlbumphotos = [];
        for (var e in (response.data as List)) {
          carAlbumphotos.add(AllPhotoModel.fromJson(e));
        }
        return right(carAlbumphotos);
      } else {
        Log.e(DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if (DioExceptions.fromDioError(e).toString() == 'Unauthorized') {
        return left('Token xato');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e(m.toString());
      return left(m.toString());
    }
  }
}
