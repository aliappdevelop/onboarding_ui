import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe_animation/model/on_boarding_model.dart';
import 'package:liquid_swipe_animation/util/app_asset.dart';
import 'package:liquid_swipe_animation/util/app_color.dart';
import 'package:liquid_swipe_animation/util/app_strings.dart';
import 'package:liquid_swipe_animation/view/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  RxInt currentPage = 0.obs;

  final controller = LiquidController();

  final pages = [
    OnBoardingPageWidget(
      onBoardingModel: OnBoardingModel(
        title: AppString.title1,
        subTitle: AppString.description1,
        bgColor: AppColor.colorScreen1,
        counterText: AppString.counter1,
        image: AppAsset.icFlutter,
      ),
    ),
    OnBoardingPageWidget(
      onBoardingModel: OnBoardingModel(
        title: AppString.title2,
        subTitle: AppString.description2,
        bgColor: AppColor.colorScreen2,
        counterText: AppString.counter2,
        image: AppAsset.icIOS,
      ),
    ),
    OnBoardingPageWidget(
      onBoardingModel: OnBoardingModel(
        title: AppString.title3,
        subTitle: AppString.description3,
        bgColor: AppColor.colorScreen3,
        counterText: AppString.counter3,
        image: AppAsset.icSecurity,
      ),
    ),
  ];

  skip() => controller.jumpToPage(page: 2);
  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }

  onPageChangedCallBack(int activePageIndex) => currentPage.value = activePageIndex;
}
