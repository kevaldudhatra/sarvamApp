import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  var pageList = [
    const HomeNavigation(),
    Container(),
    const CategoryNavigation(),
    Container(),
    Container(),
  ];

  Future<bool> backState() async {
    if (HomeNavigation.homeNavigator.currentState!.canPop()) {
      HomeNavigation.homeNavigator.currentState!.pop(HomeNavigation.homeNavigator.currentContext);
    } else if (CategoryNavigation.categoryNavigator.currentState!.canPop()) {
      CategoryNavigation.categoryNavigator.currentState!.pop(CategoryNavigation.categoryNavigator.currentContext);
    } else {
      if (selectedIndex == 0) {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      } else if (selectedIndex == 2) {
        SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundCyan,
      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: backgroundWhite,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, //New
              blurRadius: 10,
            )
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(AppImages().bottomIcon1,
                      height: 22, width: 22, color: selectedIndex == 0 ? backgroundCyan : const Color(0xFFD6E3E4)),
                  selectedIndex == 0
                      ? Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle))
                      : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(selectedIndex == 1 ? AppImages().selectedBottomIcon2 : AppImages().unselectedBottomIcon2, height: 22, width: 22),
                  selectedIndex == 1
                      ? Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle))
                      : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(AppImages().bottomIcon3, scale: 2.5),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(AppImages().bottomIcon4, height: 22, width: 22, color: selectedIndex == 3 ? backgroundCyan : null),
                  selectedIndex == 3
                      ? Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle))
                      : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Image.asset(AppImages().bottomIcon5, height: 22, width: 22, color: selectedIndex == 4 ? backgroundCyan : null),
                  selectedIndex == 4
                      ? Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle))
                      : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)
                ],
              ),
              label: "",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedFontSize: 0.0,
          currentIndex: selectedIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: backgroundCyan,
          onTap: onItemTapped,
        ),
      ),
      body: WillPopScope(
        onWillPop: backState,
        child: IndexedStack(
          index: selectedIndex,
          children: pageList,
        ),
      ),
    );
  }
}
