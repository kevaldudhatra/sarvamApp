import 'package:flutter/material.dart';
import 'package:sarvam/utils/const_colors_key.dart';

class DashboardScreenView extends StatefulWidget {
  const DashboardScreenView({Key? key}) : super(key: key);

  @override
  State<DashboardScreenView> createState() => _DashboardScreenViewState();
}

class _DashboardScreenViewState extends State<DashboardScreenView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return const Scaffold(
      backgroundColor: backgroundCyan,
    );
  }
}
