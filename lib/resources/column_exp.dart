import 'package:flutter/material.dart';

class ColumnExp extends StatelessWidget {
  final List<Widget> children;
  final int flex;
  const ColumnExp({
    required this.children,
    this.flex = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        children: children,
      ),
    );
  }
}
