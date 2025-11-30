import 'package:flutter/material.dart';

class CardPad extends StatelessWidget {
  final Widget child;
  const CardPad({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
