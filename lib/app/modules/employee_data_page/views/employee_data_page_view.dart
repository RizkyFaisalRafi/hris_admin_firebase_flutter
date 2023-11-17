import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/app/routes/app_pages.dart';
import 'package:hris_admin_firebase_flutter/models/employee_data.dart';

import '../../../../common/theme.dart';
import '../../../../widgets/employee_tile.dart';
import '../controllers/employee_data_page_controller.dart';

class EmployeeDataPageView extends GetView<EmployeeDataPageController> {
  const EmployeeDataPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee Data'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const BookAddData(),
            //   ),
            // );
          },
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            // Search
            Container(
              width: double.infinity,
              height: 100,
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Row(
                      children: [
                        const Icon(Icons.search_rounded),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextFormField(
                            // controller: controllerSearch,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                color: Color(0xff949494),
                              ),
                            ),
                            onChanged: (val) {
                              // setState(() {
                              //   // searchFromFirebase(val);
                              //   query = val;
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // List
            Expanded(
              child: StreamBuilder(
                stream: (controller.query != '' && controller.query != null)
                    ? FirebaseFirestore
                        .instance // Menampilkan semua data berdasarkan search_keywords
                        .collection("users")
                        .where("search_keywords",
                            arrayContains: controller.query!.toLowerCase())
                        .snapshots()
                    : FirebaseFirestore
                        .instance // Menampilkan semua data berdasarkan collection('book_data')
                        .collection('users')
                        .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          EmployeeData employeeData = EmployeeData(
                            uid: snapshot.data!.docs[index].id,
                            alamat: snapshot.data!.docs[index]["alamat"],
                            divisi: snapshot.data!.docs[index]["divisi"],
                            email: snapshot.data!.docs[index]["email"],
                            jabatan: snapshot.data!.docs[index]["jabatan"],
                            jenisKelamin: snapshot.data!.docs[index]
                                ["jenisKelamin"],
                            name: snapshot.data!.docs[index]["name"],
                            nip: snapshot.data!.docs[index]["nip"],
                            numberPhone: snapshot.data!.docs[index]
                                ["numberPhone"],
                            password: snapshot.data!.docs[index]["password"],
                            sisaCuti: snapshot.data!.docs[index]["sisaCuti"],
                            tanggalLahir: snapshot.data!.docs[index]
                                ["tanggalLahir"],

                            // docId: snapshot.data!.docs[index].id,
                            // bookName: snapshot.data!.docs[index]["book_name"],
                            // author: snapshot.data!.docs[index]["author"],
                            // publisher: snapshot.data!.docs[index]["publisher"],
                            // yearsOfBook: snapshot.data!.docs[index]
                            //     ["years_of_book"],
                            // isbn: snapshot.data!.docs[index]["isbn"],
                            // numberOfBooks: snapshot.data!.docs[index]
                            //     ["number_of_books"],
                            // racks: snapshot.data!.docs[index]["racks"],
                          );
                          return InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => BookDataDetail(
                              //       bookData: bookData,
                              //     ),
                              //   ),
                              // );

                              Get.toNamed(
                                Routes.EMPLOYEE_DATA_DETAIL_PAGE,
                                arguments: employeeData,
                              );
                            },
                            child: EmployeeTile(
                              employeeData: employeeData,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
