import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/all_brands/responsive/desktop_all_brand.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: DesktopAllBrandScreen());
  }
}
