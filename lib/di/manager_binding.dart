import 'package:get/get.dart';

import '../auth/controller/Login_Controller.dart';

class ManagerBindings implements Bindings {
  @override
  void dependencies() async {
    // await _initService();
    _initController();
  }

  // Future _initService() async {
  //   Get.putAsync(
  //     () => FirebaseRemoteConfigService(
  //       remoteConfig: FirebaseRemoteConfig.instance,
  //     ).init(),
  //   );
  //   Get.putAsync(
  //     () => NetworkService(
  //       NetworkInfoI(connectivity: Connectivity()),
  //     ).init(),
  //     permanent: true,
  //   );
  //   Get.putAsync(() => ThemeService().init());
  //   Get.put<PermissionService>(PermissionServiceI());
  //   Get.putAsync(() => AuthService().init());
  // }

  void _initController() async {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
