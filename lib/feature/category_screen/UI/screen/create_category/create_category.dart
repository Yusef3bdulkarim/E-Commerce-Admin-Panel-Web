import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/create_category/responsive/desktope_create_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/create_category/responsive/mobile_create_category.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/create_category/responsive/tablet_create_category.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DesktopeCreateCategoryScreen(),
      tablet: TabletCreateCategoryScreen(),
      mobile: MobileCreateCategoryScreen(),
    );
  }
}
