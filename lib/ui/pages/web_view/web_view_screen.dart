import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_theme.dart';
import '../../../utils/extensions.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double progress = 0;
  WebViewModel? webViewModel;
  // String url = '';

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  void initState() {
    webViewModel = Get.arguments as WebViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: AppTheme.appBarBottomDivider(),
        backgroundColor: AppColor.whiteTextColor,
        elevation: 0,
        title: Text(
          webViewModel?.title ?? '',
          style: AppTextStyles.textStyleBlack22With700,
        ),
        leading: InkWell(
          onTap: () async {
            Get.back(result: "");
          },
          child: const Icon(Icons.arrow_back_ios_rounded),
        ),
        foregroundColor: AppColor.blackColor,
      ),
      backgroundColor: AppColor.whiteTextColor,
      body: SafeArea(child: _getBody(context: context)),
    );
  }

  Widget _getBody({required BuildContext context}) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest:
              URLRequest(url: WebUri.uri(Uri.parse(webViewModel?.url ?? ''))),
          initialOptions: options,
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) {},
          androidOnPermissionRequest: (controller, origin, resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url!;

            if (![
              "http",
              "https",
              "file",
              "chrome",
              "data",
              "javascript",
              "about"
            ].contains(uri.scheme)) {
              // if (await canLaunch(url)) {
              //   // Launch the App
              //   await launch(
              //     url,
              //   );
              //   // and cancel the request
              //   return NavigationActionPolicy.CANCEL;
              // }
            }
            return NavigationActionPolicy.ALLOW;
          },
          onLoadStop: (controller, url) async {},
          onLoadError: (controller, url, code, message) {},
          onProgressChanged: (controller, progress) {
            if (progress == 100) {}
            setState(() {
              this.progress = progress / 100;
            });
          },
          onConsoleMessage: (controller, consoleMessage) {},
        ),
        progress < 1.0
            ? Center(
                child: CircularProgressIndicator(
                  value: progress,
                  color: AppColor.primaryColor,
                  backgroundColor: AppColor.primaryColor.withOpacity(0.25),
                ),
              )
            : Container(),
      ],
    ).paddingAll4();
  }
}

class WebViewModel {
  String url;
  String title;

  WebViewModel(this.url, this.title);
}
