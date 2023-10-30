import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  const CustomizedButton({
    Key? key,
    required this.text,
    this.icon,
    this.color,
    this.fun,
    this.textStyle,
    this.width,
    this.radius,
    this.height,
  }) : super(key: key);
  final String text;
  final IconData? icon;
  final Color? color;
  final Function()? fun;
  final double? width;
  final TextStyle? textStyle;
  final BorderRadius? radius;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.width;
    final dynamicHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: fun,
      child: Container(
        width: width ?? (icon == null ? dynamicWidth * 0.4672 : dynamicWidth * 0.9345),
        height: height??dynamicHeight * 0.0647,
        decoration:  BoxDecoration(
          color: color ?? const Color.fromRGBO(118, 173, 255, 1),
          borderRadius:radius?? const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: icon == null
            ? Center(
          child: Text(text, style: textStyle??Theme.of(context).textTheme.bodyLarge),
        )
            : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(
                width: 16.25,
              ),
              Text(text, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}