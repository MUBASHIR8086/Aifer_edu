import 'package:flutter/material.dart';
import '../model/image_model.dart';
import '../service/image_service.dart';

class GalleryProvider extends ChangeNotifier {
  final ImageService service = ImageService();

  List<ImageModel> images = [];
  bool isLoading = false;
  String error = '';

  Future<void> loadImages() async {
    isLoading = true;

    notifyListeners();

    try {
      images = await service.fetchImages();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
