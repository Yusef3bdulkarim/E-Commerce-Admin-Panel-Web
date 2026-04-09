import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/responsive/dashboard_desktop.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/responsive/dashboard_mobile.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/responsive/dashboard_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(
        desktop: DashboardDesktop(),
        tablet: DashboardTablet(),
        mobile: DashboardMobile());
  }
}
