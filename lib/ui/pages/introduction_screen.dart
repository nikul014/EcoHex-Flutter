import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_challenge/ui/widgets/base_common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_icons.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/size_config.dart';
import '../../routing/route_names.dart';
import '../../utils/extensions.dart';
import '../widgets/base_button.dart';

class IntroductionViewPage extends StatefulWidget {
  const IntroductionViewPage({super.key});

  @override
  State<IntroductionViewPage> createState() => _IntroductionViewPageState();
}

class _IntroductionViewPageState extends State<IntroductionViewPage>
    with BaseCommonWidget {
  final List<String> imageList = [
    AppIcons.intro1,
    AppIcons.intro2,
    AppIcons.intro3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.backgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppIcons.grassBack,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.logoWhite,
                  width: 200,
                ),
                8.rVerticalSizedBox(),
                CarouselSlider(
                  options: CarouselOptions(
                      height: 340.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 4 / 5,
                      autoPlayInterval: const Duration(seconds: 3),
                      viewportFraction: 0.8),
                  items: imageList.map((imageUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Get.toNamed(communityChallengeViewRoute);
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imageUrl,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fitWidth,
                              )),
                        );
                      },
                    );
                  }).toList(),
                ),
                24.rVerticalSizedBox(),
                BaseButton(
                    text: "Let's Start",
                    onSubmit: () async {
                      Get.offAllNamed(loginViewRoute);
                    }).paddingHorizontal16(),
                4.rVerticalSizedBox(),
                Text(
                  "© 2024 Eco Challenge. All rights reserved.",
                  style: AppTextStyles.textStylePrimary12With400,
                ),
                24.rVerticalSizedBox(),
              ],
            ).paddingScreen(),
          ),
        ],
      ),
    );
  }
}
