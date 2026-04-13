import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/feature/media/logic/media_cubit.dart';

class FolderDropdownScreen extends StatelessWidget {
  const FolderDropdownScreen({super.key, this.onChanged, required this.selcetedValue});
final MediaCategory selcetedValue;
  final void Function(MediaCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: DropdownButtonFormField<MediaCategory>(
          isExpanded: false,
          value: selcetedValue,
          items: MediaCategory.values
              .map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(
                      category.name.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          onChanged: onChanged),
    );
  }
}
