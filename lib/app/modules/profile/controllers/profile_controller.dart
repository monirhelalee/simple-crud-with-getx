import 'package:get/get.dart';

import '../../../core/service/token_repo.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  final tokenRepo = TokenRepo();

  onLogOut() async {
    await tokenRepo.setToken("");
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
