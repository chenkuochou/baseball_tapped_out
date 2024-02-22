import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage myCachedImg(String url, {double? height, double? width}) =>
    CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
