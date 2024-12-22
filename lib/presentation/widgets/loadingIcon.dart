import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitSpinningLines(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
