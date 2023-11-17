import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hris_admin_firebase_flutter/common/theme.dart';
import 'package:hris_admin_firebase_flutter/models/employee_data.dart';

import '../controllers/employee_data_detail_page_controller.dart';

class EmployeeDataDetailPageView
    extends GetView<EmployeeDataDetailPageController> {
  // final EmployeeData employeeData;
  const EmployeeDataDetailPageView({Key? key}) : super(key: key);

  /// Change Button
  Widget changeButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, 0),
        ),
      ]),
      child: TextButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => BookAddData(
          //       bookData: bookData,
          //     ),
          //   ),
          // );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          'Ubah',
          style:
              TextStyle(fontSize: 16, fontWeight: medium, color: Colors.white),
        ),
      ),
    );
  }

  /// Delete Button
  // Widget deleteButton(BuildContext context) {
  //   return Container(
  //     height: 50,
  //     width: double.infinity,
  //     margin: const EdgeInsets.only(top: 8, bottom: 20, left: 16, right: 16),
  //     decoration:
  //         BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
  //       BoxShadow(
  //         color: Colors.grey.withOpacity(0.5),
  //         spreadRadius: 2,
  //         blurRadius: 8,
  //         offset: const Offset(0, 0),
  //       ),
  //     ]),
  //     child: TextButton(
  //       onPressed: () async {
  //         try {
  //           await FirebaseFirestore.instance
  //               .collection('users')
  //               .doc(employeeData.uid)
  //               .delete();
  //           if (context.mounted) {
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text('Data Deleted Successfully'),
  //                 backgroundColor: Colors.red,
  //               ),
  //             );
  //           }
  //         } catch (e) {
  //           debugPrint(e.toString());
  //         }
  //       },
  //       style: TextButton.styleFrom(
  //         backgroundColor: Colors.red,
  //         shape:
  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       ),
  //       child: Text(
  //         'Delete',
  //         style:
  //             TextStyle(fontSize: 16, fontWeight: medium, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Image
            Center(
              child: Image.asset(
                'assets/logo_app.png',
                width: double.infinity,
                // height: 270,
              ),
            ),

            const SizedBox(height: 16),

            // Nama Pegawai
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // NIP
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Tanggal Lahir
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Jenis Kelamin
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Divisi
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Jabatan
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Email
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Password
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Role
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Sisa Cuti
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),

            // Alamat
            // Card(
            //   child: ListTile(
            //     title: const Text('name'),
            //     trailing: Text(bookData.bookName ?? 'Null'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
