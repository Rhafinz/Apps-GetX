import 'package:get/get.dart';
import 'package:myapp/app/modules/tag/views/show_tag._view.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/biodata/bindings/biodata_binding.dart';
import '../modules/biodata/views/biodata_view.dart';
import '../modules/biodata/views/output_view.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/create_kategori_view.dart';
import '../modules/kategori/views/edit_kategori_view.dart';
import '../modules/kategori/views/kategori_view.dart';
import '../modules/kategori/views/show_kategori_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/tag/bindings/tag_binding.dart';
import '../modules/tag/views/create_tag_view.dart';
import '../modules/tag/views/edit_tag_view.dart';
import '../modules/tag/views/tag_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/create_user_view.dart';
import '../modules/user/views/edit_user_view.dart';
import '../modules/user/views/show_user_view.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BOTTOM_MENU;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => const CounterView(),
      binding: CounterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.BIODATA,
      page: () => const BiodataView(),
      binding: BiodataBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.OUTPUT,
      page: () => OutputView(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => BottomMenuView(),
      binding: BottomMenuBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.KATEGORI,
      page: () => KategoriView(),
      binding: KategoriBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CREATE_KATEGORI,
      page: () => CreateKategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: Routes.EDIT_KATEGORI,
      page: () => EditKategoriView(),
      binding: KategoriBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SHOW_KATEGORI,
      page: () => ShowKategoriView(),
      binding: KategoriBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.TAG,
      page: () => TagView(),
      binding: TagBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CREATE_TAG,
      page: () => CreateTagView(),
      binding: TagBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.EDIT_TAG,
      page: () => EditTagView(),
      binding: TagBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SHOW_TAG,
      page: () => ShowTagView(),
      binding: TagBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.USER,
      page: () => UserView(),
      binding: UserBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.CREATE_USER,
      page: () => CreateUserView(),
      binding: UserBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.EDIT_USER,
      page: () => EditUserView(),
      binding: UserBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: Routes.SHOW_USER,
      page: () => ShowUserView(),
      binding: UserBinding(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}
