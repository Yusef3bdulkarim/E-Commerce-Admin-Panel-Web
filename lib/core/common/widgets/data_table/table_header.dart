import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/device/device_utility.dart';

class TableHeader extends StatelessWidget {
  const TableHeader({super.key, this.onPressed, required this.buttonText, this.searchController, this.searchOnChange});

  final Function()? onPressed;
  final String buttonText;
  final TextEditingController? searchController;
  final Function(String)? searchOnChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: onPressed, child: Text(buttonText)),
              ),
            ],
          ),
        ),
        Expanded(
          flex: TDeviceUtils.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: searchOnChange,
            decoration: const InputDecoration(
                hintText: 'Search here...',
                prefixIcon: Icon(Iconsax.search_normal)),
          ),
        )
      ],
    );
  }
}
