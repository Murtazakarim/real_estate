import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/fade_in_animation_controller.dart';
import '../../models/animatePositionedModel.dart';
class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.animate,
    required this.child,
  }) : super(key:key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedPositioned(duration: Duration(milliseconds: durationInMs),
      top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
      left: controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
      right: controller.animate.value ? animate!.rightAfter : animate!.rightBefore,
      bottom: controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,child: child,
    ),
    );
  }

}
// AnimatedOpacity