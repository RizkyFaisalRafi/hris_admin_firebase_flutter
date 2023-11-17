// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';

import '../common/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String imageAsset;
  // final bool obscureText;
  final Function validate;
  final bool? isShow;
  bool obscure = true;
  final Function togleObscure;
  final TextInputType typeForm;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.imageAsset,
    // required this.obscureText,
    required this.validate,
    this.isShow,
    required this.obscure,
    required this.togleObscure,
    required this.typeForm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: const Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    imageAsset,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) => validate(value),
                      controller: controller,
                      obscureText: obscure,
                      keyboardType: typeForm,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: const TextStyle(
                          color: Color(0xff949494),
                        ),
                        suffixIcon: Builder(
                          builder: (context) {
                            if (isShow == true) {
                              return IconButton(
                                onPressed: () async {
                                  togleObscure();
                                },
                                icon: Iconify(
                                  obscure
                                      ? Eva.eye_off_outline
                                      : Eva.eye_outline,
                                  color: obscure
                                      ? greyColor
                                      : const Color(0xFF00AFFF),
                                ),
                              );
                            } else {
                              return const SizedBox(
                                width: 0,
                                height: 0,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
