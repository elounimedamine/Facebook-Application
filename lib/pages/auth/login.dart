import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/pages/auth/signup.dart';
import 'package:summer_cump_project_2022/pages/core/homepage.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';
import 'package:summer_cump_project_2022/utils/app_strings.dart';
import 'package:summer_cump_project_2022/utils/app_styles.dart';
import 'package:summer_cump_project_2022/utils/dims.dart';

TextEditingController _emailCtrl = TextEditingController();
TextEditingController _passCtrl = TextEditingController();

AuthServices _authServices = AuthServices();

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
                Row(
                  children: [
                    Expanded(
                        child: CupertinoButton(
                            color: Colors.blue,
                            child: const Text('Login'),
                            onPressed: () async {
                              if (_emailCtrl.text.trim().isEmpty ||
                                  _passCtrl.text.isEmpty) {
                                const snakabar = SnackBar(
                                    content: Text(
                                        "Email/Password cannot be empty!"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snakabar);
                              } else {
                                dynamic creds = await _authServices.loginUser(
                                    _emailCtrl.text, _passCtrl.text);
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
                              //         builder: (context) => const Homepage()));
                            })),
                  ],
                ),
                const SizedBox(height: 24),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const SignUpPage()));
                          }),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
