import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/app.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/headers/header.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/slidebars/sliderbar.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TSliderbar(),
      appBar: THeader(),
      body: body??const SizedBox(),
    );
  }
}
