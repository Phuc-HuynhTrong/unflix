import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MoviePosterController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late PageController pageController ;
  int page = 3;
  @override
  void onInit() {
    pageController = PageController();
    _animationController =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(() => nextMovie());

    super.onInit();
  }

  void onClose() {
    super.onClose();
    _animationController.reset();
    _animationController.dispose();
    pageController.dispose();
    print('close controller');
  }
  get getPage => this.page;
  nextMovie() {
    if (page > 1) {
      pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(() => nextMovie());
      page -= 1;
    } else {
      page = 3;
      _animationController.reset();
      _animationController.forward().whenComplete(() => nextMovie());
      pageController.animateToPage(0,
          duration: Duration(milliseconds: 350), curve: Curves.ease);
    }
  }
}
