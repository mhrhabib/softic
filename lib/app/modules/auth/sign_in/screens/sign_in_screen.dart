import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softic/app/core/values/text_style.dart';
import 'package:softic/app/core/widgets/app_bar.dart';
import 'package:softic/app/modules/auth/sign_in/controllers/auth_controller.dart';

class SignInScreen extends GetWidget<AuthContoller> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBar(
          title: Text(
        'Softic',
        style: titleTextStyle(),
      )),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Image.asset('images/login.png'),
              Text(
                "Login to your",
                style: titleTextStyle().copyWith(fontSize: 40),
              ),
              Text(
                "account",
                style: titleTextStyle().copyWith(fontSize: 40),
              ),
              const SizedBox(height: 24),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.userConntroller,
                        decoration: InputDecoration(
                          label: const Text('User Name'),
                          prefixIcon: const Icon(Icons.person_2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (bool? value) {
                              controller.rememberMe.value = value!;
                            }),
                        const Text("Remember me.")
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          minimumSize: const Size(200, 50)),
                      onPressed: () {
                        controller.loginWithEmail();
                      },
                      child: Text(
                        "Log In",
                        style: titleTextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
