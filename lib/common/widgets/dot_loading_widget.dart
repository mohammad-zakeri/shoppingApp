import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DotLoadingWidget extends StatelessWidget {
  const DotLoadingWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.ltr,

      child: Center(
        child: LoadingAnimationWidget.prograssiveDots(size: size, color: Colors.redAccent),
      ),

    );

  }

}
