import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmeulkit/pages/home.dart';
import 'package:zmeulkit/utils/constant.dart';

getAppBar(String screenName) {
  return AppBar(
    leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.qrcode,
          color: primaryColor,
        )),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      screenName,
      style: style1.copyWith(fontWeight: FontWeight.w900),
    ),
    actions: [
      InkWell(
        onTap: () {
          Get.to(Home());
        },
        child: Row(
          children: const [
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(
                  CupertinoIcons.add_circled,
                  color: tertiaryColor,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      const SizedBox(
        width: 20,
      ),
    ],
  );
}
