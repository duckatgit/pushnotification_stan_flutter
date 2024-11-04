import 'package:flutter/material.dart';

import '../constants/path_constant.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Widget widget;
  final double? width;
  const CustomButton({
    required this.onTap,
    required this.widget,
    this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? MediaQuery.sizeOf(context).width * 0.8,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              PathConstant.buttonBg,
            ),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: widget,
        ),
      ),
    );
  }
}
