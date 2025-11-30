import 'package:flutter/material.dart';

class BodySingle extends StatelessWidget {
  final List<Widget> children;
  const BodySingle({
    required this.children,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool anchoMayor = MediaQuery.of(context).size.width > 1600;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: anchoMayor
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 1600,
                    child: Column(
                      children: children,
                    ),
                  ),
                ],
              )
            : Column(
                children: children,
              ),
      ),
    );
  }
}