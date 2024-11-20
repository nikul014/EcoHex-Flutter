import 'package:cached_network_image/cached_network_image.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_icons.dart';
import '../../constants/app_text_styles.dart';
import '../../constants/enums/view_state.dart';
import '../../constants/size_config.dart';
import '../../utils/extensions.dart';

mixin  BaseCommonWidget {
  showMessageInWithoutContextSnackBar(String message, bool isError) {
    try {
      Get.snackbar(
        "",
        "",
        isDismissible: true,
        maxWidth: double.infinity,
        backgroundColor: isError ? AppColor.redColor : AppColor.greenColor,
        colorText: AppColor.whiteColor,
        duration: const Duration(milliseconds: 1500),
        titleText: Text(
          message,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.whiteColor,
          ),
        ),
      );
    } catch (e) {
      Fimber.e(e.toString());
    }
  }

  Widget getProgressBar(ViewStateEnum viewState) {
    if (viewState == ViewStateEnum.busy) {
      return Container(
          color: AppColor.blackTextColor.withOpacity(.2),
          child: getLoadingWidget());
    } else {
      return Container();
    }
  }

  Widget getLoadingWidget() {
    return Container(
      color: AppColor.blackTextColor.withOpacity(.2),
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  Widget getPaginationProgressBar(ViewStateEnum viewState,
      {List? dataList, bool showAtTop = false}) {
    if (viewState == ViewStateEnum.busy) {
      return dataList.isNotNullOrEmpty
          ? Align(
              alignment:
                  showAtTop ? Alignment.topCenter : Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: AppColor.blackTextColor.withOpacity(.2),
                height: 80,
                child: const Center(
                        child:
                            CircularProgressIndicator()) // BaseLoadMoreWidget())
                    .paddingAllDefault(),
              ),
            )
          : getLoadingWidget();
    } else {
      return Container();
    }
  }

  /// App CommonText Widget

  Widget appTextWidget({
    String txtTitle = "",
    Color txtColor = AppColor.whiteColor,
    FontWeight fontWeight = FontWeight.w400,
    FontStyle fontStyle = FontStyle.normal,
    double fontSize = 14.0,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.left,
    TextOverflow overflow = TextOverflow.ellipsis,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      txtTitle,
      maxLines: maxLine,
      style: TextStyle(
        color: txtColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: SizeConfig.setSp(fontSize),
        letterSpacing: 0.5,
        decoration: decoration,
      ),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  Widget loadCachedNetworkImage({
    String? imageUrl,
    double height = 138,
    double width = 165,
    BoxFit boxFit = BoxFit.cover,
    Widget containerChild = const SizedBox.shrink(),
  }) {
    return CachedNetworkImage(
      fit: boxFit,
      imageUrl: imageUrl!,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
        child: containerChild,
      ),
      placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            AppIcons.placeHolder,
            fit: BoxFit.cover,
          )),
      errorWidget: (context, url, error) => SizedBox(
          height: height,
          width: width,
          child: Image.asset(AppIcons.placeHolder, fit: BoxFit.cover)),
    );
  }

  Widget getBottomSheetHeader({String? title, required onBack}) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title ?? '',
          style: AppTextStyles.textStyleBlack22With700,
        ).visibleWhen(isVisible: title.isNotNullOrEmpty)),
        InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              AppIcons.iconClose,
              color: AppColor.blackColor,
              width: 24.rSize(),
              height: 24.rSize(),
            )),
      ],
    );
  }
}
