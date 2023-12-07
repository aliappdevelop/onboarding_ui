import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liquid_swipe_animation/model/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.onBoardingModel,
  });

  final OnBoardingModel onBoardingModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: onBoardingModel.bgColor!,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: size.height * .09,
          ),
          SvgPicture.asset(
            onBoardingModel.image!,
            height: size.height * 0.40,
          ),
          Text(
            onBoardingModel.title!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: size.height * .004,
          ),
          Text(
            onBoardingModel.subTitle!,
            textAlign: TextAlign.center,
            maxLines: 5,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70, height: 1.5),
          ),
          SizedBox(
            height: size.height * .04,
          ),
          Text(
            onBoardingModel.counterText!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xff272727), height: 1.5),
          ),
        ],
      ),
    );
  }
}
