import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage customCachedNetworkImage(String _imageUrl) {
  return CachedNetworkImage(
    imageUrl: _imageUrl,
    placeholder: (context, url) => Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: Placeholder(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
        CircularProgressIndicator(),
      ],
    ),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: BoxFit.fill,
  );
}
