import 'package:aifer_edu/model/image_model.dart';
import 'package:dio/dio.dart';

class ImageService {
  final Dio _dio = Dio();

  Future<List<ImageModel>> fetchImages() async {
    try {
      final Response response = await _dio.get(
        'https://picsum.photos/v2/list?page=1&limit=20',
      );

      // 🔍 DEBUG
      print('STATUS CODE: ${response.statusCode}');
      print('RESPONSE TYPE: ${response.data.runtimeType}');

      if (response.statusCode == 200) {
        final List data = response.data;
        return data.map<ImageModel>((e) => ImageModel.fromJson(e)).toList();
      } else {
        throw Exception('API Error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('Dio error: ${e.message}');
      throw Exception('Network error');
    } catch (e) {
      print('Unknown error: $e');
      throw Exception('Failed to load images');
    }
  }
}
