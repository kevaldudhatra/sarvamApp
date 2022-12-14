import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sarvam/screens/categoryScreen/category_screen_view.dart';
import 'package:sarvam/screens/dailyRoutineScreen/daily_routine_screen_view.dart';
import 'package:sarvam/screens/flashScreen/flash_screen_view.dart';
import 'package:sarvam/screens/forgotPasswordScreen/forgot_screen_view.dart';
import 'package:sarvam/screens/homeScreen/home_screen_view.dart';
import 'package:sarvam/screens/loginScreen/login_screen_view.dart';
import 'package:sarvam/screens/membershipScreen/membership_screen_view.dart';
import 'package:sarvam/screens/prayerDetailScreen/prayer_detail_screen_view.dart';
import 'package:sarvam/screens/prayerScreen/prayer_screen_view.dart';
import 'package:sarvam/screens/registerScreen/register_screen_view.dart';
import 'package:sarvam/screens/resetPasswordScreen/reset_password_screen_view.dart';
import 'package:sarvam/screens/subscriptionScreen/subscription_screen_view.dart';
import 'package:sarvam/screens/uploadWorkScreen/upload_screen_view.dart';
import 'package:sarvam/screens/welcomeScreen/welcome_screen_view.dart';
import 'package:sarvam/utils/const_key.dart';

part 'app_routes.dart';

class RouteGenerator {
  int duration = 500;
  final storage = GetStorage();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.FLASH_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const FlashScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.WELCOME_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const WelcomeScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.LOGIN_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const LoginScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.REGISTER_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const RegisterScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.FORGOT_PASSWORD_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const ForgotPasswordScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.RESET_PASSWORD_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const ResetPasswordScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      case Routes.HOME_SCREEN:
        return GetPageRoute(
          routeName: settings.name,
          page: () => const HomeScreenView(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );

      default:
        return GetPageRoute(
          routeName: settings.name,
          page: () => storage.hasData(LOGIN_TRUE) && storage.read(LOGIN_TRUE) == true ? const HomeScreenView() : const FlashScreen(),
          transition: Transition.noTransition,
          transitionDuration: Duration(milliseconds: duration),
        );
    }
  }
}

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> homeNavigator = GlobalKey<NavigatorState>();

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: HomeNavigation.homeNavigator,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case Routes.SUBSCRIPTION_SCREEN:
                return const SubscriptionScreenView();
              case Routes.MEMBERSHIP_SCREEN:
                return const MembershipScreenView();
              case Routes.CATEGORY_SCREEN:
                return const CategoryScreenView();
              case Routes.DAILY_ROUTINE_SCREEN:
                return DailyRoutineScreenView(categoryData: null);
              case Routes.PRAYER_SCREEN:
                return PrayerScreenView(subCategoryData: null);
              case Routes.PRAYER_DETAIL_SCREEN:
                return PrayerDetailScreenView(contentData: null);
              case Routes.UPLOAD_WORK_SCREEN:
                return const UploadScreenView();
            }
            return storage.hasData(ACTIVE_PLAN) && storage.read(ACTIVE_PLAN) == true ? const CategoryScreenView() : const SubscriptionScreenView();
          },
        );
      },
    );
  }
}

class CategoryNavigation extends StatefulWidget {
  const CategoryNavigation({Key? key}) : super(key: key);
  static GlobalKey<NavigatorState> categoryNavigator = GlobalKey<NavigatorState>();

  @override
  State<CategoryNavigation> createState() => _CategoryNavigationState();
}

class _CategoryNavigationState extends State<CategoryNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: CategoryNavigation.categoryNavigator,
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case Routes.CATEGORY_SCREEN:
                return const CategoryScreenView();
              case Routes.DAILY_ROUTINE_SCREEN:
                return DailyRoutineScreenView(categoryData: null);
              case Routes.PRAYER_SCREEN:
                return PrayerScreenView(subCategoryData: null);
              case Routes.PRAYER_DETAIL_SCREEN:
                return PrayerDetailScreenView(contentData: null);
              case Routes.UPLOAD_WORK_SCREEN:
                return const UploadScreenView();
            }
            return const CategoryScreenView();
          },
        );
      },
    );
  }
}
