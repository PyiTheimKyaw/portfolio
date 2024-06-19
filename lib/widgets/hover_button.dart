import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/colors.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/widgets/customized_text_view.dart';

class HoverButton extends StatefulWidget {
  const HoverButton({
    super.key,
    this.btnText,
    required this.onTapBtn,
    this.icon,
    this.fontAweIcon,
    this.isIconOnly = false,
    this.btnRadius = kRadius15,
  });

  final String? btnText;
  final Function onTapBtn;
  final IconData? icon;
  final IconData? fontAweIcon;
  final bool? isIconOnly;
  final double btnRadius;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..translate(0, -2, 0);
    final transform = _isHovered ? hoveredTransform : Matrix4.identity();
    return GestureDetector(
      onTap: () {
        widget.onTapBtn();
      },
      child: MouseRegion(
        onEnter: (event) => onEntered(true),
        onExit: (event) => onEntered(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
            padding: const EdgeInsets.all(kMargin8),
            decoration: BoxDecoration(
              borderRadius: (widget.isIconOnly ?? false)
                  ? null
                  : BorderRadius.circular(
                      widget.btnRadius,
                    ),
              shape: (widget.isIconOnly ?? false) ? BoxShape.circle : BoxShape.rectangle,
              color: _isHovered ? kHoveredColor : null,
              border: Border.all(
                color: kHoveredColor,
              ),
            ),
            duration: const Duration(milliseconds: 200),
            transform: transform,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.btnText != null,
                  child: CustomizedTextView(
                    textData: widget.btnText ?? "",
                    textColor: _isHovered ? kBlackColor : kHoveredColor,
                  ),
                ),
                Visibility(
                  visible: widget.icon != null,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widget.btnText != null ? kMargin8 : 0,
                    ),
                    child: Icon(
                      widget.icon,
                      color: _isHovered ? kBlackColor : kHoveredColor,
                      size: kDownloadIconSize,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.fontAweIcon != null,
                  child: FaIcon(
                    widget.fontAweIcon,
                    color: _isHovered ? kBlackColor : kHoveredColor,
                    size: kDownloadIconSize,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
