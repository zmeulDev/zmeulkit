import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zmeulkit/models/user_model.dart';
import 'package:zmeulkit/utils/constant.dart';
import 'package:zmeulkit/utils/getImages.dart';
import 'package:zmeulkit/utils/loading.dart';
import 'package:zmeulkit/widgets/createAvatarWidget.dart';
import 'package:zmeulkit/widgets/noFavQrWidget.dart';

import 'appBar.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late DocumentSnapshot id;
  CollectionReference qrCollection =
      FirebaseFirestore.instance.collection('codes');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('tkyo'),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                userContainer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'My favourites',
                        style: style1.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => Home());
                      },
                      child: Text(
                        'Show all',
                        style: style3.copyWith(color: tertiaryColor),
                      ),
                    ),
                  ],
                ),
                myFavouriteCodes(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  userContainer() {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: tertiaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                createAvatarWidget(25),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserModel().username != ''
                        ? Text(
                            UserModel().username,
                            style: style2.copyWith(
                                color: secondaryColor, fontSize: 18),
                          )
                        : Text('Hello!',
                            style: style2.copyWith(
                                color: secondaryColor, fontSize: 18)),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: qrCollection
                    .where('uid', isEqualTo: UserModel().uid)
                    .where('isMain', isEqualTo: '1')
                    .limit(1)
                    .snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: loading(),
                    );
                  } else {
                    List<DocumentSnapshot> list = snapshot.data.docs;
                    if (list.isEmpty) {
                      return Container(
                        height: size.height * 0.3,
                        child: Image.asset('assets/logo.png'),
                      );
                    } else {
                      return Container(
                        height: size.height * 0.35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: GetImage(
                              imagePath: list[index]['qrUrl'],
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ),
                      );
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }

  myFavouriteCodes() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: StreamBuilder(
          stream: qrCollection
              .where('uid', isEqualTo: UserModel().uid)
              .where('isFav', isEqualTo: '1')
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loading(),
              );
            } else {
              List<DocumentSnapshot> list = snapshot.data.docs;
              if (list.isEmpty) {
                return noFavQrWidget();
              } else {
                return Text('ListViewBuilder');
              }
            }
          }),
    );
  }
}
