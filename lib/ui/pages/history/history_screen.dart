import 'package:eco_challenge/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_sized_box.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/enums/view_state.dart';
import '../../../constants/size_config.dart';
import '../../../utils/extensions.dart';
import '../../widgets/base_common_widget.dart';
import '../weekly_challenge/impact_details_screen.dart';
import 'history_controller.dart';

class HistoryScreen extends GetView<HistoryController> with BaseCommonWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weekly Challenge"),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (HistoryController model) {
              return getBody(context);
            },
          ),
        ));
  }

  Widget getBody(BuildContext context) {
    return Stack(children: [
      controller.dataList.isNotEmpty
          ? RefreshIndicator(
              onRefresh: () async {
                controller.resetPagination();
              },
              child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    if (scrollNotification.metrics.pixels >=
                            scrollNotification.metrics.maxScrollExtent &&
                        !controller.hasReachedMax &&
                        !controller.isLoading()) {
                      controller.pageNo = (controller.pageNo + 1);
                      controller.loadMore();
                    }
                    return false;
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.dataList.length + 1,
                    itemBuilder: (context, index) {
                      if (index < controller.dataList.length) {
                        final challenge = controller.dataList[index];
                        return Container(
                          decoration: AppTheme.boxDecorationPrimaryCard,
                          margin: const EdgeInsets.all(10),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              Get.to(() => ImpactDetailScreen(
                                    weeklyChallenge: challenge,
                                  ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(challenge.title,
                                    style:
                                        AppTextStyles.textStyleBlack16With700),
                                4.rVerticalSizedBox(),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today,
                                        size: 16, color: AppColor.primaryColor),
                                    4.rHorizontalSizedBox(),
                                    Text(
                                      "${challenge.startDate} - ${challenge.endDate}",
                                      style: AppTextStyles
                                          .textStyleBlackTwo12With400,
                                    ),
                                  ],
                                ),
                                4.rVerticalSizedBox(),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        size: 16, color: AppColor.primaryColor),
                                    4.rHorizontalSizedBox(),
                                    Text(
                                      "Points: ${challenge.pointsForCompletion}",
                                      style: AppTextStyles
                                          .textStyleBlackTwo12With400,
                                    ),
                                  ],
                                ),
                                3.rVerticalSizedBox(),
                                Text(
                                  challenge.description,
                                  style: AppTextStyles
                                      .textStyleBlackThree12With400,
                                ),
                              ],
                            ).paddingAll12(),
                          ),
                        );
                      } else if (controller.moreLoading == ViewStateEnum.busy) {
                        return controller.loadMoreLoader(
                            color: AppColor.blackColor);
                      } else {
                        return AppSizedBox.sizedBox0;
                      }
                    },
                  )),
            )
          : Center(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  controller.resetPagination();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh_outlined,
                      size: 24.rSize(),
                      color: AppColor.primaryColor,
                    ),
                    Text(
                      'No data available!',
                      style: AppTextStyles.textStyleBlack16With400,
                    ),
                  ],
                ).paddingAll12(),
              ),
            ),
      controller.state == ViewStateEnum.busy
          ? const Center(child: CircularProgressIndicator())
          : AppSizedBox.sizedBox0
    ]).paddingSymmetricSide(vertical: 8, horizontal: 16);
  }
}
