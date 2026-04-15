import 'package:flutter/cupertino.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/edit_banner/responsive/desktop_edit_banner.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: DesktopEditBannerScreen());
  }
}
