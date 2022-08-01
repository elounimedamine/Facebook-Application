import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/models/end_user.dart';
import 'package:summer_cump_project_2022/pages/auth/login.dart';
import 'package:summer_cump_project_2022/pages/core/homepage.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';
import 'package:summer_cump_project_2022/utils/app_strings.dart';
import 'package:summer_cump_project_2022/utils/app_styles.dart';
import 'package:summer_cump_project_2022/utils/dims.dart';

TextEditingController _fullnameCtrl = TextEditingController();
TextEditingController _emailCtrl = TextEditingController();
TextEditingController _phoneCtrl = TextEditingController();
TextEditingController _passCtrl = TextEditingController();
TextEditingController _confirmPassCtrl = TextEditingController();

bool _isPasswordMatch = false;

AuthServices _authServices = AuthServices();

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  Text(AppStrings.CreateAccounePageSignUp,
                      style: AppStyles.authTextTitle),
                ]),
                const SizedBox(height: 24),
                TextField(
                  controller: _fullnameCtrl,
                  decoration: InputDecoration(
                      hintText: 'username',
                      suffixIcon: IconButton(
                        onPressed: () => _fullnameCtrl.clear(),
                        icon: const Icon(Icons.clear),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(CupertinoIcons.person,
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
                  controller: _emailCtrl,
                  decoration: InputDecoration(
                      hintText: 'client@gmail.com',
                      suffixIcon: IconButton(
                        onPressed: () => _emailCtrl.clear(),
                        icon: const Icon(Icons.clear),
                      ),
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
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'phone number',
                      suffixIcon: IconButton(
                        onPressed: () => _phoneCtrl.clear(),
                        icon: const Icon(Icons.clear),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade600),
                      prefixIcon: const Icon(CupertinoIcons.phone,
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
                      suffixIcon: IconButton(
                        onPressed: () => _passCtrl.clear(),
                        icon: const Icon(Icons.clear),
                      ),
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
                TextField(
                  obscureText: true,
                  controller: _confirmPassCtrl,
                  onChanged: (val) {
                    setState(() {
                      _passCtrl.text == val
                          ? _isPasswordMatch = true
                          : _isPasswordMatch = false;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'confirm password',
                      suffixIcon: IconButton(
                        onPressed: () => _confirmPassCtrl.clear(),
                        icon: const Icon(Icons.clear),
                      ),
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
                const SizedBox(
                  height: 6,
                ),
                Visibility(
                    visible: _isPasswordMatch,
                    replacement: Row(
                      children: const [
                        Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.redAccent,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'passwords do not match.',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          CupertinoIcons.checkmark_circle_fill,
                          color: Colors.teal,
                          size: 18,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          'passwords match.',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ],
                    )),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                            color: Colors.blue,
                            child: const Text('Sign Up'),
                            onPressed: () async {
                              EndUser newUser = EndUser(
                                  uid: 'uid',
                                  fullname: _fullnameCtrl.text.trim(),
                                  phone: _phoneCtrl.text.trim(),
                                  email: _emailCtrl.text.trim());
                              if (_fullnameCtrl.text.trim().isNotEmpty &&
                                  _emailCtrl.text.trim().isNotEmpty &&
                                  _phoneCtrl.text.trim().isNotEmpty &&
                                  _passCtrl.text.trim().isNotEmpty &&
                                  _passCtrl.text == _confirmPassCtrl.text) {
                                dynamic creds =
                                    await _authServices.registerUser(
                                        newUser, _passCtrl.text.trim());

                                if (creds == null) {
                                  const snakabar = SnackBar(
                                      content: Text("Email/Password invalid!"));
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snakabar);
                                } else {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushReplacement(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (context) =>
                                              const Homepage()));
                                }
                              }
                              // Navigator.pushReplacement(
                              //     context,
                              //     CupertinoPageRoute(
                              //         builder: (context) => const LoginPage()));
                            })),
                  ],
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const LoginPage()));
                          }),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
