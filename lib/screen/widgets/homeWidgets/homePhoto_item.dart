import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../../../models/SearchModel.dart';
import '../../../models/allAlbum.model.dart';
import '../../../storage/storage.dart';
import '../../pages/others/SearchEterPage.dart';
import '../../pages/others/homePhotoEnter.dart';

Widget homeItem1(AllPhotoModel model, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomePhotoEnter(model)));
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: model.urls!.small!,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Type',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 218, 216, 216),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}

Widget searchItem(Result post, BuildContext context) {
  return InkWell(
    onTap: () {
      searchedPhotos!.add(post.description!);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchPhotoEnter(post),
        ),
      );
    },
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image(
            image: NetworkImage(post.urls!.small!),
          ),
        ),
        Container(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Type',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Color.fromARGB(255, 218, 216, 216),
                  ))
            ],
          ),
        )
      ],
    ),
  );
}
