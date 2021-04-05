import 'package:flutter/material.dart';

class FadeInContainer extends StatefulWidget {
  final Widget child;
  final int delayInMilliSec;
  const FadeInContainer({@required this.child, this.delayInMilliSec});

  @override
  _FadeInContainerState createState() => _FadeInContainerState();
}

class _FadeInContainerState extends State<FadeInContainer>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<Offset> slideAnimation;
  Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    slideAnimation = Tween<Offset>(begin: Offset(0, -100), end: Offset.zero)
        .animate(animationController);
    fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(animationController);
    widget.delayInMilliSec == null
        ? animationController.forward()
        : Future.delayed(Duration(milliseconds: widget.delayInMilliSec))
            .then((_) => animationController.forward());
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideAnimation,
      builder: (context, child) => AnimatedBuilder(
        animation: fadeAnimation,
        builder: (context, child) => Transform.translate(
          offset: Offset(slideAnimation.value.dx, slideAnimation.value.dy),
          child: Opacity(
            opacity: fadeAnimation.value,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
