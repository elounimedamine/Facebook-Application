import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:summer_cump_project_2022/pages/auth/login.dart';
import 'package:summer_cump_project_2022/services/auth_services.dart';
import 'package:summer_cump_project_2022/utils/temp_data.dart';
import 'package:summer_cump_project_2022/widgets/rounded_border_button.dart';

AuthServices _authServices = AuthServices();

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
        child: Column(
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
                                  builder: (context) => const LoginPage())));
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
            const CircleAvatar(
              radius: 64,
              foregroundImage: NetworkImage(TempData.userAvatarURL),
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 18,
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
        ),
      )),
    );
  }
}
