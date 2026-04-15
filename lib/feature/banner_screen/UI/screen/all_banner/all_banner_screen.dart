import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/all_banner/responsive/desktop_all_banner.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/all_brands/responsive/desktop_all_brand.dart';

class AllBannerScreen extends StatelessWidget {
  const AllBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: DesktopAllBannerScreen());
  }
}
