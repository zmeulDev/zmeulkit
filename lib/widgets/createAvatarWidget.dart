import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zmeulkit/models/user_model.dart';
import 'package:zmeulkit/utils/constant.dart';

createAvatarWidget(double radius) {
  return AvatarView(
    radius: radius,
    borderColor: fourthColor,
    avatarType: AvatarType.CIRCLE,
    backgroundColor: tertiaryColor,
    imagePath: UserModel().profileUrl,
    placeHolder: Container(
      color: secondaryColor,
      child: Icon(
        CupertinoIcons.profile_circled,
        size: 36,
      ),
    ),
    errorWidget: Container(
      color: secondaryColor,
      child: Icon(
        CupertinoIcons.exclamationmark_triangle,
        size: 36,
      ),
    ),
  );
}
