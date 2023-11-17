import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/widgets/button_custom.dart';
import 'package:hris_admin_firebase_flutter/widgets/custom_text_field.dart';

import '../../../../common/theme.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Admin'),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Header
                    Image.asset(
                      'assets/logo_app.png',
                      width: 220,
                      height: 220,
                    ),
                    const SizedBox(height: 28),

                    Text(
                      'Sign In Admin',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: medium,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Email
                    CustomTextField(
                      obscure: false,
                      controller: controller.emailC,
                      validate: controller.validateEmail,
                      hintText: 'Email',
                      typeForm: TextInputType.emailAddress,
                      isShow: false,
                      togleObscure: controller.toggleObscureText,
                      imageAsset: 'assets/icon_email.png',
                    ),

                    const SizedBox(height: 12),

                    // Password
                    Obx(
                      () => CustomTextField(
                        obscure: controller.obscureText.value,
                        controller: controller.passC,
                        validate: controller.validatePass,
                        hintText: 'Your Password',
                        typeForm: TextInputType.visiblePassword,
                        isShow: true,
                        togleObscure: controller.toggleObscureText,
                        imageAsset: 'assets/icon_password.png',
                      ),
                    ),
                    const SizedBox(height: 32),
                    ButtonCustom(
                      label: 'Masuk',
                      onTap: () async {
                        if (controller.formKey.currentState!.validate()) {
                          await controller.login();
                        }
                      },
                      isExpand: true,
                    ),

                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // provider.resetPassword(context);
                        },
                        child: const Text(
                          'Lupa Password',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
