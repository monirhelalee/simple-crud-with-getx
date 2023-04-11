import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_crud_with_getx/app/core/common_widgets/common_button.dart';
import 'package:simple_crud_with_getx/app/core/resource/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavbar(),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      );

  Widget _body() => SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            _profilePicture(),
            _profileInfo(
              title: "Email",
              icon: Icons.email_outlined,
              data: "monir@gmail.com",
            ),
            _profileInfo(
              title: "Phone",
              icon: Icons.phone_android_outlined,
              data: "+01786416417",
            ),
            _profileInfo(
              title: "Phone",
              icon: Icons.phone_android_outlined,
              data: "+01786416417",
            ),
          ],
        ),
      );

  Widget _bottomNavbar() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: CommonButton(
          onTap: () async {
            await controller.onLogOut();
          },
          buttonTitle: "LOG OUT",
        ),
      );

  Widget _profilePicture() => Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            Icons.person_2_outlined,
            color: Colors.white,
            size: 100,
          ),
        ),
      );
  Widget _profileInfo({String? title, IconData? icon, String? data}) => Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: AppTheme.darkBlueColor),
                  const SizedBox(width: 10),
                  Text(
                    "$title",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.darkBlueColor),
                  ),
                ],
              ),
              Text(
                "$data",
                style: GoogleFonts.poppins(
                    fontSize: 16, color: AppTheme.darkBlueColor),
              ),
            ],
          ),
        ),
      );
}
