import 'package:flutter/material.dart';
import 'package:sarvam/utils/const_colors_key.dart';
import 'package:sarvam/utils/const_fonts_key.dart';
import 'package:sarvam/utils/const_image_key.dart';

class OrderListScreenView extends StatefulWidget {
  const OrderListScreenView({Key? key}) : super(key: key);

  @override
  State<OrderListScreenView> createState() => _OrderListScreenViewState();
}

class _OrderListScreenViewState extends State<OrderListScreenView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundCyan,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(width: width, child: Image.asset(AppImages().subscriptionBackground1, fit: BoxFit.fill)),
          Container(
            margin: EdgeInsets.only(top: height * 0.25),
            width: width,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: backgroundWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Image.asset(AppImages().subscriptionBackground2, fit: BoxFit.fill),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
            height: height,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.25 - 50,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Image.asset(AppImages().backArrow, scale: 3.0, color: backgroundWhite),
                                const SizedBox(width: 10),
                                const Text(
                                  "Back",
                                  style: TextStyle(fontSize: 15, fontFamily: ROBOTO_BOLD, color: backgroundWhite),
                                )
                              ],
                            ),
                          ),
                          const Spacer(),
                          Image.asset(AppImages().profileIcon, fit: BoxFit.fill, scale: 3)],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.05),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Orders List",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontFamily: ROBOTO_BOLD, fontSize: 30, color: backgroundWhite),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: height * 0.75 - 115,
                  width: width,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
