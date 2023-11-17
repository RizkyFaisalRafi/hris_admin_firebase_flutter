import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/app/routes/app_pages.dart';
import 'package:hris_admin_firebase_flutter/common/theme.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePageView'),
        centerTitle: true,
        actions: [
          InkWell(
            child: const Icon(Icons.logout),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN_PAGE);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Header
              Image.asset(
                'assets/logo_app.png',
                width: 220,
                height: 220,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu Admin',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                child: ListTile(
                  onTap: () {
                    Get.toNamed(Routes.EMPLOYEE_DATA_PAGE);
                  },
                  title: const Text('Data Pegawai'),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const Card(
                child: ListTile(
                  title: Text('Penggajian'),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const Card(
                child: ListTile(
                  title: Text('Pengumuman'),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Card(
                child: ListTile(
                  title: Text('Article / Blog'),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
