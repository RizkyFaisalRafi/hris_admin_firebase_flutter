import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/app/routes/app_pages.dart';

class LoginPageController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool obscureText = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  // Validasi Email
  String? validateEmail(email) {
    if (email.isEmpty) {
      return "Email tidak boleh kosong";
    } else if (email.contains(RegExp(r'[!#<>?":$_`~;[\]\\|=+)(*&^%-]'))) {
      return 'Email tidak boleh mengandung karakter khusus!';
    } else {
      return null;
    }
  }

  // Validasi Pass
  String? validatePass(pass) {
    if (pass.isEmpty) {
      return "Password tidak boleh kosong!";
    } else if (pass.split('').length < 8) {
      return 'Password harus terdiri dari minimal 8 kata!';
    } else {
      return null;
    }
  }

  // Show Password
  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    update();
  }

  Future<void> login() async {
    isLoading.value = true;
    // ignore: unused_local_variable
    UserCredential userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailC.text,
        password: passC.text,
      );
      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified == true) {
          // isLoading.value = false;
          Get.offAllNamed(Routes.HOME_PAGE);
        } else {
          log('Belum Verifikasi');
        }
      }
    } on FirebaseAuthException catch (error) {
      Get.snackbar('Terjadi Kesalahans', error.code.toString());
    } catch (e) {
      log("Error : $e");
    }
  }
}
