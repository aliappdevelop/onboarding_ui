import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe_animation/controllers/on_boarding_controllers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              pages: obController.pages,
              liquidController: obController.controller,
              enableSideReveal: true,
              enableLoop: false,
              slideIconWidget: const Icon(
                Icons.arrow_back_ios,
              ),
              onPageChangeCallback: obController.onPageChangedCallBack),
          Positioned(
            bottom: 105.0,
            child: OutlinedButton(
              onPressed: () => obController.animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(color: Color(0xff272727), shape: BoxShape.circle),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => obController.skip(),
              child: const Text("Skip",
                  style: TextStyle(
                    color: Color(0xff272727),
                    fontSize: 16,
                    fontWeight: FontWeight.w700
                  )),
            ),
          ),
          Obx(
            () => Positioned(
              bottom: 40,
              child: AnimatedSmoothIndicator(
                count: 3,
                activeIndex: obController.currentPage.value,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 10,
                  dotWidth: 10
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
