import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PreviewCardImage extends StatelessWidget {
  final String url;
  final AssetImage errorImage;
  const PreviewCardImage({
    Key? key,
    required this.url,
    required this.errorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        height: 131,
        width: 131,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Container(
        height: 131,
        width: 131,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey,
          image: DecorationImage(
            image: errorImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}