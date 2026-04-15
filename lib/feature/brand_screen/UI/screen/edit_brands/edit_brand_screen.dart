import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/edit_brands/responsive/desktop_edit_brand.dart';

class EditBrandScreen extends StatelessWidget {
  const EditBrandScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: DesktopEditBrandScreen());
  }
}
