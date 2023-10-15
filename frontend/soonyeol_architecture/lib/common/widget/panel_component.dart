import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soonyeol_architecture/common/common.dart';

// PanelComponent
// This component is used to display a panel at the bottom of the screen
class PanelComponent extends StatelessWidget {
  Widget child;
  double radius;
  PanelComponent({
    super.key,
    required this.child,
    this.radius = 20,
  });

  // Build
  // This displays the panel at the bottom of the screen
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Transparent container to capture tap events and dismiss the panel
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            height: Get.height,
            width: Get.width,
          ),
        ),
        // Panel content
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
              height: Get.height * 0.8,
              width: Common.getWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius))),
              child: SingleChildScrollView(child: child)),
        )
      ],
    );
  }
}
