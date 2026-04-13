import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/responsive/responsive_widget.dart';
class TSiteTemplate extends StatelessWidget {
  const TSiteTemplate({
    super.key,
    required this.desktop,
     this.tablet,
   this.mobile,
  });

  final Widget desktop;
  final Widget ?tablet;
  final Widget? mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TResponsiveWidget(
        desktop: desktop,
        tablet: tablet??desktop,
        mobile: mobile??desktop,
      ),
    );
  }
}