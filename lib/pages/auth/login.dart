import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/pages/core/homepage.dart';
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
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          //top: false,
          //bottom: true,
          //left: false,
          //right: false,
          child: Container(
            margin: AppDims.globalMargin,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 64),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(AppStrings.LoginPageSignIn,
                      style: AppStyles.authTextTitle),
                ]),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                      hintText: 'client@gmail.com',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(CupertinoIcons.mail_solid,
                          color: Colors.blue, size: 18),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200),
                ),
                const SizedBox(height: 24),
                TextField(
                  obscureText: true,
                  controller: _passCtrl,
                  decoration: InputDecoration(
                      hintText: '********',
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(CupertinoIcons.lock_fill,
                          color: Colors.blue, size: 18),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                            color: Colors.blue,
                            child: const Text('Login'),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const Homepage()));
                            })),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
