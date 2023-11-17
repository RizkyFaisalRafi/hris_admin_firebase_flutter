import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/widgets/button_custom.dart';
import 'package:hris_admin_firebase_flutter/widgets/custom_text_field.dart';

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
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Header
              Image.asset(
                'assets/logo_app.png',
                width: 200,
                height: 200,
              ),
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

              // Password
              Obx(() => CustomTextField(
                    obscure: controller.obscureText.value,
                    controller: controller.passC,
                    validate: controller.validatePass,
                    hintText: 'Your Password',
                    typeForm: TextInputType.visiblePassword,
                    isShow: true,
                    togleObscure: controller.toggleObscureText,
                    imageAsset: 'assets/icon_password.png',
                  )),
              const SizedBox(
                height: 32,
              ),
              ButtonCustom(
                label: 'Masuk',
                onTap: () async{
                  if (controller.formKey.currentState!.validate()) {
                    await controller.login();
                  }
                },
                isExpand: true,
              )
            ],
          ),
        ));
  }
}
