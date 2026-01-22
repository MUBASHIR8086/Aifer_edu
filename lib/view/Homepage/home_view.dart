import 'package:aifer_edu/controller/image_provider.dart';
import 'package:aifer_edu/view/widget/error_widgect.dart';
import 'package:aifer_edu/view/widget/grid_widgect.dart';
import 'package:aifer_edu/view/widget/slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GalleryProvider>().loadImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Gallery",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Consumer<GalleryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error.isNotEmpty) {
            return Errormessage(provider.error);
          }

          if (provider.images.isEmpty) {
            return const Center(child: Text("No images found"));
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TopImageSlider(image: provider.images.first),
              ),

              Expanded(child: Grid(provider)),
            ],
          );
        },
      ),
    );
  }
}
