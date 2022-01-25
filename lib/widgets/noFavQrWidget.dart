import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmeulkit/utils/constant.dart';

noFavQrWidget() {
  return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: fourthColor,
          image: DecorationImage(
            image: AssetImage("assets/logo.png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: secondaryColor,
                    child: Icon(
                      CupertinoIcons.star_fill,
                      color: tertiaryColor,
                      size: 32,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'There are no favorites codes.',
                        style: style1.copyWith(
                            color: secondaryColor, fontSize: 16),
                      ),
                      Container(
                        width: 250,
                        child: Text(
                          'Here you can display your favourite codes for easy access.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style: style2.copyWith(
                              color: secondaryColor, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
}
