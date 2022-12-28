import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarvam/routes/app_pages.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
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
    return SafeArea(
      top: false,
      child: Scaffold(
        key: key,
        extendBody: true,
        backgroundColor: backgroundCyan,
        drawer: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Drawer(
                backgroundColor: backgroundWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(AppImages().profileImage, fit: BoxFit.fill, height: 60, width: 60),
                          const SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Welcome To",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_REGULAR, color: drawerText),
                              ),
                              Text(
                                "Hello, John Smith",
                                textAlign: TextAlign.start,
                                style: TextStyle(fontFamily: ROBOTO_MEDIUM, fontSize: 18, color: textBlack),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(height: 25),
                      Container(
                        height: 45,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          color: backgroundCyan,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppImages().dashboardIcon, fit: BoxFit.fill, height: 25, width: 25),
                            const SizedBox(width: 5),
                            const Text(
                              "Dashboard",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages().myWorkIcon, fit: BoxFit.fill, height: 25, width: 25),
                          const SizedBox(width: 5),
                          const Text(
                            "My Work",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages().myProfileIcon, fit: BoxFit.fill, height: 25, width: 25),
                          const SizedBox(width: 5),
                          const Text(
                            "My Profile",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages().orderListIcon, fit: BoxFit.fill, height: 25, width: 25),
                          const SizedBox(width: 5),
                          const Text(
                            "Order List",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages().feedbackIcon, fit: BoxFit.fill, height: 25, width: 25),
                          const SizedBox(width: 5),
                          const Text(
                            "Feedback",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(AppImages().feedbackIcon, fit: BoxFit.fill, height: 25, width: 25),
                          const SizedBox(width: 5),
                          const Text(
                            "Grievances",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_REGULAR, fontSize: 15, color: drawerText),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          color: backgroundCyan,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: const Center(
                          child: Text(
                            "Log Out",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontFamily: ROBOTO_BOLD,color: backgroundWhite),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 0,
              child: InkWell(
                onTap: () {
                  if (key.currentState!.isDrawerOpen) {
                    key.currentState!.openEndDrawer();
                  }
                },
                child: Image.asset(AppImages().drawerCloseIcon, fit: BoxFit.fill, height: 30, width: 30),
              ),
            ),
          ],
        ),
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
                  children: [Image.asset(AppImages().bottomIcon1, height: 22, width: 22, color: selectedIndex == 0 ? backgroundCyan : const Color(0xFFD6E3E4)), selectedIndex == 0 ? Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5, decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle)) : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [Image.asset(selectedIndex == 1 ? AppImages().selectedBottomIcon2 : AppImages().unselectedBottomIcon2, height: 22, width: 22), selectedIndex == 1 ? Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5, decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle)) : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(AppImages().bottomIcon3, height: 60, width: 60),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [Image.asset(AppImages().bottomIcon4, height: 22, width: 22, color: selectedIndex == 3 ? backgroundCyan : null), selectedIndex == 3 ? Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5, decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle)) : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: [Image.asset(AppImages().bottomIcon5, height: 22, width: 22, color: selectedIndex == 4 ? backgroundCyan : null), selectedIndex == 4 ? Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5, decoration: const BoxDecoration(color: selectedTabIndicator, shape: BoxShape.circle)) : Container(margin: const EdgeInsets.only(top: 5), height: 5, width: 5)],
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
      ),
    );
  }
}
