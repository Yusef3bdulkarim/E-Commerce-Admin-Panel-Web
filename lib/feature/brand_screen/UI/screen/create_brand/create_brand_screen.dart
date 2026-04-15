import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/create_brand/responsive/desktop_create_brand.dart';

class CreateBrandScreen extends StatelessWidget {
  const CreateBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: DesktopCreateBrandScreen());
  }
}
