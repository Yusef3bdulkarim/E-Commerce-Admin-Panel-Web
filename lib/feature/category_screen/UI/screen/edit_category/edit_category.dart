import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/edit_category/responsive/desktop_edit_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/edit_category/responsive/mobile_edit_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/edit_category/responsive/tablet_edit_category.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DesktopEditCategoryScreen(),
      tablet: TabletEditCategoryScreen(),
      mobile: MobileEditCategoryScreen(),
    );
  }
}
