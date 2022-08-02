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
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        margin: AppDims.globalMargin,
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStrings.loginPageSignIN,
                  style: AppStyles.authTitleStyle,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: _emailCtrl,
              decoration: InputDecoration(
                  hintText: 'client@mail.com',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    CupertinoIcons.at,
                    color: Colors.blue,
                    size: 18,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              obscureText: true,
              controller: _passCtrl,
              decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: const Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.blue,
                    size: 18,
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  filled: true,
                  fillColor: Colors.grey.shade200),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                    child: CupertinoButton(
                        color: Colors.blue,
                        child: const Text('LOGIN'),
                        onPressed: () async {
                          if (_emailCtrl.text.trim().isEmpty ||
                              _passCtrl.text.isEmpty) {
                            const snackbar = SnackBar(
                                content:
                                    Text("Email/Password cannot be empty!"));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackbar);
                          } else {
                            dynamic creds = await _authServices.loginUser(
                                _emailCtrl.text, _passCtrl.text);
                            if (creds == null) {
                              const snackbar = SnackBar(
                                  content: Text("Email/Password invalid!"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackbar);
                            } else {
                              Navigator.pushReplacement(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => const Homepage()));
                            }
                          }
                        })),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              children: [
                const Text('not a member yet?'),
                const SizedBox(
                  width: 6,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SignupPage()));
                  },
                  child: const Text('join us'),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
