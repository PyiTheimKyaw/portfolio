import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  const HoverTextButton({super.key, required this.builder});

  final Widget Function(bool isHovered) builder;

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0,-2,0);
    final transform = _isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.builder(_isHovered)),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
