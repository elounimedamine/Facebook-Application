import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/utils/app_strings.dart';
import 'package:summer_cump_project_2022/utils/app_styles.dart';
import 'package:summer_cump_project_2022/utils/dims.dart';

TextEditingController _emailCtrl = TextEditingController();
TextEditingController _passCtrl = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      //top: false,
      //bottom: true,
      //left: false,
      //right: false,
      child: Container(
        margin: AppDims.globalMargin,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(AppStrings.LoginPageSignIn, style: AppStyles.authTextTitle),
            ]),
            const SizedBox(height: 24),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail_solid),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _passCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.mail_solid),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
