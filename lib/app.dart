import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/containers/rounded_container.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_app.dart';
import 'core/utils/constants/text_strings.dart';
import 'core/utils/device/web_material_scroll.dart';
import 'core/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: TTexts.appName,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class ResponsiveDessignScreen extends StatelessWidget {
  const ResponsiveDessignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsetsGeometry.all(30),
        child: TSiteTemplate(
          desktop: Desktop(),
          mobile: Mobile(),
          tablet: Tablet1(),
        ));
  }
}

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    // شلنا الـ SizedBox عشان ميعملش Conflict مع الـ Layout الأساسي
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: TRoundedContainer(
                  height: 350, // كبرنا الارتفاع شوية عشان يكون متناسق
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  child: const Center(child: Text("Box1")),
                ),
              ),
              const Gap(20),
              Expanded(
                child: Column(
                  children: [
                    TRoundedContainer(
                      height: 165, // ظبطنا الارتفاع
                      backgroundColor: Colors.orange.withOpacity(0.25),
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: TRoundedContainer(
                            height: 165,
                            backgroundColor: Colors.blueGrey.withOpacity(0.25),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: TRoundedContainer(
                            height: 165,
                            backgroundColor: Colors.amberAccent.withOpacity(0.25),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const Gap(20),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TRoundedContainer(
                  height: 215,
                  backgroundColor: Colors.green.withOpacity(0.25),
                ),
              ),
              const Gap(20),
              Expanded(
                child: TRoundedContainer(
                  height: 215,
                  backgroundColor: Colors.orange.withOpacity(0.25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class Tablet1 extends StatelessWidget {
  const Tablet1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // عشان يظبط المحاذاة من فوق
              children: [
                Expanded(
                  child: TRoundedContainer(
                    height: 350,
                    backgroundColor: Colors.blue.withOpacity(0.2),
                    child: const Center(child: Text("Box1")),
                  ),
                ),
                const Gap(20),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      TRoundedContainer(
                        height: 215,
                        backgroundColor: Colors.orange.withOpacity(0.25),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          // لازم Expanded هنا يا يوسف عشان المربعات تظهر
                          Expanded(
                            child: TRoundedContainer(
                              height: 215,
                              backgroundColor:
                                  Colors.blueGrey.withOpacity(0.25),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: TRoundedContainer(
                              height: 215,
                              backgroundColor:
                                  Colors.amberAccent.withOpacity(0.25),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const Gap(20), // مسافة بين الصفين
            // الصف التحتاني يفضل يكون Row برضه عشان الـ Expanded
            Row(
              children: [
                Expanded(
                  child: TRoundedContainer(
                    height: 215,
                    backgroundColor: Colors.green.withOpacity(0.25),
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: TRoundedContainer(
                    height: 215,
                    backgroundColor: Colors.orange.withOpacity(0.25),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
