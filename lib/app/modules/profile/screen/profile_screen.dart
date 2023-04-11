import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/modules/profile/controller/profile_controller.dart';

import '../widgets/profile_widget.dart';

class ProfileScreen extends GetWidget<ProfileController> {
  const ProfileScreen({super.key});





 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          title: Text(
        "Profile",
        style: titleTextStyle(),
      )),
      body: controller.obx((state) {
        return SingleChildScrollView(
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
                        imagePath: state!.imageUrl!, 
                        onClicked: () async {},
                      ),
                      const SizedBox(height: 20),
                      Text(
                        state.firstName!,
                        style: titleTextStyle().copyWith(color: Colors.white),
                      ),
                      Text(
                        state.email!,
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
      );
      },
      onLoading: const Center(child: CircularProgressIndicator()),
      onError: (error) => Text(error.toString()),),
    );
  }
}
