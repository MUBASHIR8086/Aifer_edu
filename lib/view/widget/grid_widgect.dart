import 'package:aifer_edu/controller/image_provider.dart';
import 'package:aifer_edu/view/widget/imagecard_page.dart';
import 'package:flutter/cupertino.dart';

Widget Grid(GalleryProvider provider) {
  return GridView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: provider.images.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75,
    ),
    itemBuilder: (context, index) {
      final image = provider.images[index];
      return ImageCard(image: image);
    },
  );
}
