import 'package:flutter_svg/flutter_svg.dart';

class CacheImg {
  static const String imageHistory =
      'https://upload.wikimedia.org/wikipedia/commons/0/09/America_Online_logo.svg';
  static const String imageShared =
      'https://api.dicebear.com/7.x/pixel-art/svg?seed=2';
  static const String imageMap =
      'https://api.dicebear.com/7.x/pixel-art/svg?seed=3';

  static void svgPrecacheImage() {
    const cacheSvgImages = [
      /// Specify the all the svg image to cache
      CacheImg.imageHistory,
      CacheImg.imageShared,
      CacheImg.imageMap,
    ];

    for (String element in cacheSvgImages) {
      var loader = SvgNetworkLoader(element);
      svg.cache
          .putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
      print(svg.cache.count);
    }
  }
}
