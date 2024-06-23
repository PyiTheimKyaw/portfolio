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
    this.textUnHoveredColor = kHoveredColor,
    this.btnUnHoveredBorderColor = kHoveredColor,
    this.btnUnHoveredColor,
    this.isDense = false,
    this.isSelected = false,
    this.iconHoveredColor = kBlackColor,
    this.iconUnHoveredColor = kHoveredColor,
    this.btnHoveredColor = kHoveredColor,
    this.iconSize = kDownloadIconSize,
    this.btnPadding = kMargin16,
    this.customImg,
    this.btnTextFontSize = kFont20,
  });

  final String? btnText;
  final Function onTapBtn;
  final IconData? icon;
  final IconData? fontAweIcon;
  final bool? isIconOnly;
  final double btnRadius;
  final Color? textUnHoveredColor;
  final Color btnUnHoveredBorderColor;
  final Color? btnUnHoveredColor;
  final bool? isDense;
  final bool? isSelected;
  final Color? iconHoveredColor;
  final Color? iconUnHoveredColor;
  final Color? btnHoveredColor;
  final double? iconSize;
  final double? btnPadding;
  final String? customImg;
  final double? btnTextFontSize;

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
            padding: EdgeInsets.all(widget.btnPadding ?? 0),
            width: (widget.isDense ?? false) ? MediaQuery.of(context).size.width : null,
            decoration: BoxDecoration(
              borderRadius: (widget.isIconOnly ?? false)
                  ? null
                  : BorderRadius.circular(
                      widget.btnRadius,
                    ),
              shape: (widget.isIconOnly ?? false) ? BoxShape.circle : BoxShape.rectangle,
              color: (widget.isSelected ?? false)
                  ? kHoveredColor
                  : _isHovered
                      ? widget.btnHoveredColor
                      : widget.btnUnHoveredColor,
              border: Border.all(
                color: (widget.isSelected ?? false)
                    ? kHoveredColor
                    : _isHovered
                        ? kHoveredColor
                        : widget.btnUnHoveredBorderColor,
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
                    textColor: (widget.isSelected ?? false)
                        ? kBlackColor
                        : _isHovered
                            ? kBlackColor
                            : widget.textUnHoveredColor,
                    textFontSize: widget.btnTextFontSize ?? 0,
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
                      color: _isHovered ? widget.iconHoveredColor : widget.iconUnHoveredColor,
                      size: kDownloadIconSize,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.fontAweIcon != null,
                  replacement: (widget.customImg != null)
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: widget.btnText != null ? kMargin8 : 0,
                          ),
                          child: Image.asset(
                            widget.customImg ?? "",
                            width: widget.iconSize,
                            height: widget.iconSize,
                            color: _isHovered ? widget.iconHoveredColor : widget.iconUnHoveredColor,
                          ),
                        )
                      : const SizedBox.shrink(),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widget.btnText != null ? kMargin8 : 0,
                    ),
                    child: FaIcon(
                      widget.fontAweIcon,
                      color: _isHovered ? widget.iconHoveredColor : widget.iconUnHoveredColor,
                      size: widget.iconSize,
                    ),
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
