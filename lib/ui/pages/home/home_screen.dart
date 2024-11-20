import 'package:carousel_slider/carousel_slider.dart';
import 'package:eco_challenge/constants/app_text_styles.dart';
import 'package:eco_challenge/constants/app_theme.dart';
import 'package:eco_challenge/data_handler/data_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/size_config.dart';
import '../../../routing/route_names.dart';
import '../../../utils/extensions.dart';
import '../../widgets/base_common_widget.dart';
import '../community_challenge/community_challenge_detail.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> with BaseCommonWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<String> imageList = [
    'https://images.stockcake.com/public/c/8/8/c8822623-17c6-42df-8eea-079d4746d3a1_large/sunset-mountain-reflection-stockcake.jpg',
    'https://img.freepik.com/premium-photo/crystal-clear-water-mountain-lake-reflects-surrounding-mountains-trees_604472-14888.jpg',
    'https://media.istockphoto.com/id/485371557/photo/twilight-at-spirit-island.jpg?s=612x612&w=0&k=20&c=FSGliJ4EKFP70Yjpzso0HfRR4WwflC6GKfl4F3Hj7fk='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (HomeController model) {
              return getBody(context);
            },
          ),
        ));
  }

  Widget getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 0.95),
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
                    child: loadCachedNetworkImage(
                      imageUrl: imageUrl,
                      width: MediaQuery.of(context).size.width,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        16.rVerticalSizedBox(),
        Text(
          "Upcoming Challenges",
          style: AppTextStyles.textStylePrimary14With600,
        ).paddingHorizontal8(),
        4.rVerticalSizedBox(),
        Expanded(
          child: ListView.builder(
            itemCount: DataConstants.challenges.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final challenge = DataConstants.challenges[index];
              return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    Get.to(() => ChallengeDetailScreen(challenge: challenge));
                  },
                  child: Container(
                      decoration: AppTheme.boxDecorationPrimaryCard,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.successGreen.withOpacity(.1),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                              ),
                              child: Text(
                                challenge.points,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.successGreen),
                              ).paddingUpSide48(),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left side: Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: loadCachedNetworkImage(
                                  imageUrl: challenge.image,
                                  height: 72,
                                  width: 72,
                                ),
                              ),
                              8.rHorizontalSizedBox(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Challenge Name
                                    Text(
                                      challenge.challengeName,
                                      style:
                                          AppTextStyles.textStyleBlack14With700,
                                    ),
                                    2.rVerticalSizedBox(),
                                    Text(
                                      challenge.description,
                                      style: AppTextStyles
                                          .textStyleBlackTwo14With400,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    2.rVerticalSizedBox(),
                                    Text(
                                      "${challenge.startDate} - ${challenge.endDate}",
                                      style: AppTextStyles
                                          .textStyleBlackTwo12With400,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).paddingAllDefault(),
                        ],
                      )).paddingAllDefault());
            },
          ),
        ),
      ],
    ).paddingHorizontal16();
  }
}
