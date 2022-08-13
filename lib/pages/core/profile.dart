import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/models/end_user.dart';
import 'package:summer_cump_project_2022/pages/auth/login.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';
import 'package:summer_cump_project_2022/utils/temp_data.dart';
import 'package:summer_cump_project_2022/widgets/rounded_border_button.dart';

AuthServices _authServices = AuthServices();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: _authServices.getUserData(_firebaseAuth.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //var body = json.decode(snapshot.data!.toString());
                // ignore: avoid_print
                print('response: ${snapshot.data!["fullname"]}');
                //print('body: $body');
                EndUser userInfo = EndUser(
                    uid: '',
                    fullname: snapshot.data!["fullname"],
                    avatarUrl: snapshot.data!["avatar_url"],
                    email: snapshot.data!["email"],
                    phone: snapshot.data!["phone"]);
                //print(userInfo.fullname);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            splashRadius: 18,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(CupertinoIcons.chevron_back)),
                        const Text(
                          'Homepage',
                          style: TextStyle(color: Colors.black87, fontSize: 13),
                        ),
                        const Spacer(),
                        TextButton(
                            onPressed: () async {
                              await _authServices.logout().then((value) =>
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const LoginPage())));
                            },
                            child: const Text('logout')),
                        const SizedBox(
                          width: 26,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CircleAvatar(
                      radius: 64,
                      foregroundImage: NetworkImage(userInfo.avatarUrl!),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              '${userInfo.fullname}',
                              style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      userInfo.email!,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedBorderButton(
                          'follow',
                          btnClick: () {
                            //...
                          },
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        RoundedBorderButton(
                          '',
                          icon: CupertinoIcons.chat_bubble_2,
                          btnClick: () {
                            //...
                          },
                        )
                      ],
                    )
                  ],
                );
              } else {
                return Container();
              }
            }),
      )),
    );
  }
}
