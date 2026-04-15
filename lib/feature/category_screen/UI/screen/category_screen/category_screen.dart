import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/category_screen/responsive/desktop_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/category_screen/responsive/mobile_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/category_screen/responsive/tablet_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DesktopCategoryScreen(),
      tablet: TabletCategoryScreen(),
      mobile: MobileCategoryScreen(),
    );
  }
}
