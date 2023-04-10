import 'package:flutter/material.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';

import '../widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          title: Text(
        "Profile",
        style: titleTextStyle(),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 93, 80, 168),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileWidget(
                        imagePath:
                            'https://scontent.fdac27-1.fna.fbcdn.net/v/t39.30808-6/299657791_3219232444959410_4511597146871123200_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeF4t7uEUKvsz1qrd2r4oOCgppzbAfqCzGSmnNsB-oLMZEhl6TPvuKpoD0nbZt8ACMpDd2OWmIW8jmJN_Z7_zgwZ&_nc_ohc=iXTElK7ernkAX97EETg&_nc_ht=scontent.fdac27-1.fna&oh=00_AfCq03FPL_w_nzBfKVuBHHJbK3ZJaVTG90JGggncyrya9g&oe=6438F8EC',
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "name",
                        style: titleTextStyle().copyWith(color: Colors.white),
                      ),
                      Text(
                        "email@example.com",
                        style: titleTextStyle().copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 26, 41, 85),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        Text(
                          "Other informations",
                          style: titleTextStyle().copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
