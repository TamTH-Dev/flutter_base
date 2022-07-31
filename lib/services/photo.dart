import 'package:flutter_base/models/photo.dart';
import 'package:flutter_base/services/base_service.dart';

class PhotoService extends BaseService {
  static Future<List<Photo>> fetchPhotos({Map<String, dynamic>? params}) async {
    final response = await BaseService.get<List>('/photos', params: params);

    return Photo.fromList(response);
  }
}
