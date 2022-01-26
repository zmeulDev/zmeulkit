import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmeulkit/Services/auth_services.dart';
import 'package:zmeulkit/models/user_model.dart';
import 'package:zmeulkit/pages/Auth/chooseloginsignup.dart';
import 'package:zmeulkit/pages/imageview.dart';
import 'package:zmeulkit/pages/profile/editprofile.dart';
import 'package:zmeulkit/utils/constant.dart';
import 'package:zmeulkit/utils/helper.dart';
import 'package:zmeulkit/widgets/createAvatarWidget.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tertiaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(ImageViewPage(
                          img: UserModel().profileUrl == ''
                              ? tempUserImg
                              : UserModel().profileUrl));
                    },
                    child: createAvatarWidget(75),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UserModel().username != ''
                      ? Text(
                          UserModel().username,
                          style: style2.copyWith(
                              color: secondaryColor, fontSize: 14),
                        )
                      : Text(
                          ' Name',
                          style: style2.copyWith(
                              color: secondaryColor, fontSize: 14),
                        ),
                  UserModel().email != ''
                      ? Text(
                          UserModel().email,
                          style: style2.copyWith(
                              color: secondaryColor, fontSize: 14),
                        )
                      : Text(
                          'Email',
                          style: style2.copyWith(
                              color: secondaryColor, fontSize: 14),
                        ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    UserModel().phoneNo!,
                    style: style2.copyWith(
                        color: secondaryColor.withOpacity(0.7), fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          //Space
          SizedBox(
            height: 20,
          ),
          Container(
            height: 44,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                onPressed: () {
                  AuthServices.signOut().then((value) {
                    Helper.toReplacementScreen(context, ChooseLoginSignup());
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: tertiaryColor,
                  onPrimary: Colors.white,
                ),
                child: Text('Logout')),
          ),
          //Space
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  getAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            CupertinoIcons.qrcode,
            color: primaryColor,
          )),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        'profile',
        style: style1.copyWith(fontWeight: FontWeight.w900),
      ),
      actions: [
        IconButton(
            onPressed: () {
              Get.to(EditProfile())!.then((value) {
                setState(() {});
              });
            },
            icon: Icon(
              Icons.settings_outlined,
              color: tertiaryColor,
              size: 26,
            )),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
