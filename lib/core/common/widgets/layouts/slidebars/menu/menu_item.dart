import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TMenuItem extends StatefulWidget {
  const TMenuItem({
    super.key,
    required this.text,
    required this.icon,
    required this.route,
  });

  final String text;
  final IconData icon;
  final String route;

  @override
  State<TMenuItem> createState() => _TMenuItemState();
}

class _TMenuItemState extends State<TMenuItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive =
        GoRouterState.of(context).matchedLocation == widget.route;
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(vertical: TSizes.xs),
            decoration: BoxDecoration(
              color: isActive || isHovered
                  ? TColors.primary.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsetsGeometry.only(
                      left: TSizes.lg,
                      top: TSizes.md,
                      right: TSizes.md,
                      bottom: TSizes.md),
                  child: Icon(
                    widget.icon,
                    color: isActive || isHovered
                        ? TColors.primary
                        : TColors.darkGrey,
                  ),
                ),
                const Gap(TSizes.spaceBtwItems),
                Flexible(
                  child: isActive || isHovered
                      ? Text(
                          widget.text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.white),
                        )
                      : Text(
                          widget.text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(color: TColors.darkGrey),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// class TMenuItem extends StatefulWidget {
//   const TMenuItem({
//     super.key,
//     required this.text,
//     required this.icon,
//     required this.route,
//   });
//
//   final String text;
//   final IconData icon;
//   final String route;
//
//   @override
//   State<TMenuItem> createState() => _TMenuItemState();
// }
//
// class _TMenuItemState extends State<TMenuItem> {
//   bool isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // 1. نعرف هل ده الرووت الحالي ولا لأ؟
//     final bool isActive = GoRouterState.of(context).matchedLocation == widget.route;
//
//     return MouseRegion(
//       onEnter: (_) => setState(() => isHovered = true),
//       onExit: (_) => setState(() => isHovered = false),
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () => context.go(widget.route), // التنقل باستخدام GoRouter
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 200),
//           margin: const EdgeInsets.symmetric(vertical: TSizes.xs),
//           decoration: BoxDecoration(
//             // تغيير اللون بناءً على الـ Hover أو الـ Active State
//             color: isActive || isHovered ? TColors.primary.withOpacity(0.1) : Colors.transparent,
//             borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: TSizes.sm, horizontal: TSizes.md),
//             child: Row(
//               children: [
//                 Icon(
//                   widget.icon,
//                   // أيقونة ملونة لو نشط أو لو الماوس عليه
//                   color: isActive || isHovered ? TColors.primary : TColors.darkGrey,
//                   size: 20,
//                 ),
//                 const Gap(TSizes.spaceBtwItems),
//                 Flexible(
//                   child: Text(
//                     widget.text,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       color: isActive || isHovered ? TColors.primary : TColors.darkGrey,
//                       fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
