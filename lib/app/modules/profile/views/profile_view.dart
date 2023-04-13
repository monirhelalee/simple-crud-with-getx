import 'package:cached_network_image/cached_network_image.dart';
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

  Widget _body() => Obx(() => controller.isLoading.value
      ? const Center(child: CircularProgressIndicator())
      : SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              _profilePicture(controller.profileData.value.imageUrl ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${controller.profileData.value.firstName ?? ""} ${controller.profileData.value.lastName ?? ""}",
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkBlueColor),
              ),
              const SizedBox(
                height: 10,
              ),
              _profileInfo(
                title: "Email",
                icon: Icons.email_outlined,
                data: controller.profileData.value.email ?? "",
              ),
              _profileInfo(
                title: "Phone",
                icon: Icons.phone_android_outlined,
                data: controller.profileData.value.phone ?? "",
              ),
            ],
          ),
        ));

  Widget _bottomNavbar() => Padding(
        padding: const EdgeInsets.all(15.0),
        child: CommonButton(
          onTap: () async {
            await controller.onLogOut();
          },
          buttonTitle: "LOG OUT",
        ),
      );

  Widget _profilePicture(String imageUrl) => Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? "",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: Icon(
                  Icons.image,
                  size: 100,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.image,
                  size: 100,
                ),
              ),
            ),
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
