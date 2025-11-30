import 'package:flutter/material.dart';

class SizedRow extends StatelessWidget {
  final List<Widget> children;
  const SizedRow({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: children,
      ),
    );
  }
}