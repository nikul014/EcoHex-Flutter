import 'package:eco_challenge/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/enums/view_state.dart';
import '../../../constants/language/language_constants.dart';
import '../../../constants/size_config.dart';
import '../../../utils/extensions.dart';
import '../../../utils/validator.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_common_widget.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> with BaseCommonWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        backgroundColor: AppColor.whiteColor,
        body: SafeArea(
          child: GetBuilder(
            init: controller,
            initState: (state) async {},
            builder: (ProfileController model) {
              return getBody(context);
            },
          ),
        ));
  }

  Widget getBody(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.profileFormKey,
        child: Column(
          children: [
            36.rVerticalSizedBox(),
            SvgPicture.asset(
              AppIcons.profileIcon, // Path to your SVG file
              width: 100, // Set width if necessary
              height: 100, // Set height if necessary
            ),
            24.rVerticalSizedBox(),
            AppTextField(
              controller: controller.firstNameController,
              focusNode: controller.firstNameFocusNode,
              validator: Validations.isNotEmpty,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
              ],
              onSubmitted: (val) {
                controller.lastNameFocusNode.requestFocus();
              },
              hintText: LanguageConst.firstName,
              onChanged: (val) {
                controller.update();
              },
            ),
            4.rVerticalSizedBox(),
            AppTextField(
              controller: controller.lastNameController,
              focusNode: controller.lastNameFocusNode,
              validator: Validations.isNotEmpty,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'), allow: true)
              ],
              onSubmitted: (val) {
                controller.emailFocusNode.requestFocus();
              },
              hintText: LanguageConst.lastName,
              onChanged: (val) {
                controller.update();
              },
            ),
            4.rVerticalSizedBox(),
            AppTextField(
              textInputAction: TextInputAction.done,
              controller: controller.emailController,
              focusNode: controller.emailFocusNode,
              inputFormatters: [
                FilteringTextInputFormatter(RegExp(r'[ ]'), allow: false)
              ],
              validator: Validations.emailValidator,
              onSubmitted: (val) {
                if (controller.profileFormKey.currentState!.validate()) {
                  controller.validateAndNavigateToNext();
                }
              },
              onChanged: (val) {
                controller.update();
              },
              hintText: LanguageConst.emailAddress,
            ),
            4.rVerticalSizedBox(),
            getSignInButton(),
          ],
        ),
      ),
    ).paddingHorizontal24();
  }

  Widget getSignInButton() {
    if (controller.state == ViewStateEnum.busy) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return BaseButton(
      text: "Save",
      isWrapWidth: true,
      onSubmit: () async {
        if (controller.profileFormKey.currentState!.validate()) {
          controller.validateAndNavigateToNext();
        }
      },
    );
  }
}
