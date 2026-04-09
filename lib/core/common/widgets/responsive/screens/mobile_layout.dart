import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/headers/header.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/slidebars/sliderbar.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TSliderbar(),
      appBar: THeader(
        scaffoldKey: scaffoldKey,
      ),
      body: body ?? const SizedBox(),
    );
  }
}
