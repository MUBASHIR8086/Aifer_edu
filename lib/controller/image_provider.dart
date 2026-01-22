import 'package:aifer_edu/model/image_model.dart';
import 'package:aifer_edu/service/image_service.dart';
import 'package:flutter/material.dart';

class GalleryProvider extends ChangeNotifier {
  final ImageService service = ImageService();

  List<ImageModel> images = [];
  bool isLoading = false;
  String error = '';

  Future<void> loadImages() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedImages = await service.fetchImages();

      images = fetchedImages.reversed.toList();
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
