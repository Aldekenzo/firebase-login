import 'dart:ui';

import 'package:authtest/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<T?> showBlurredDialog<T>({
  required BuildContext context,
  Color barrierColor = const Color(0xB2333333),
  Duration transitionDuration = const Duration(milliseconds: 300),
  bool isDismissible = false,
  bool hasCloseButton = true,
  Widget? child,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  bool scrollable = false,
  EdgeInsetsGeometry padding = const EdgeInsets.all(16),
  EdgeInsetsGeometry contentPadding = const EdgeInsets.all(16),
  BorderRadiusGeometry? borderRadius,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.primary,
    ),
  );
  return showGeneralDialog(
    barrierDismissible: false,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    pageBuilder: (context, animation, secondaryAnimation) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        // resizeToAvoidBottomPadding: true,
        body: GestureDetector(
          onTap: isDismissible
              ? () {
            Navigator.of(context).pop();
          }
              : null,
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: EdgeInsets.all(0),
            child: AsterDialog(
              child: child,
              scrollable: scrollable,
              hasCloseButton: hasCloseButton,
              isDismissible: isDismissible,
              padding: padding,
              contentPadding: contentPadding,
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    ),
    transitionBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
      child: child,
      position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
    ),
    context: context,
  );
}

class AsterDialog extends StatefulWidget {
  final Widget? child;
  final bool scrollable;
  final bool isDismissible;
  final bool hasCloseButton;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadiusGeometry? borderRadius;

  AsterDialog({
    Key? key,
    this.child,
    this.scrollable = false,
    this.hasCloseButton = false,
    this.isDismissible = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 22),
    this.contentPadding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  }) : super(key: key);

  @override
  _AsterDialogState createState() => _AsterDialogState();
}

class _AsterDialogState extends State<AsterDialog> {
  final _controller = ScrollController();
  final topMarginSize = 68.0;
  bool transparentStatusBar = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.offset > topMarginSize + 96 && transparentStatusBar) {
        if (mounted) {
          setState(() {
            transparentStatusBar = false;
          });
        }
      } else if (_controller.offset <= topMarginSize + 96 && !transparentStatusBar) {
        if (mounted) {
          setState(() {
            transparentStatusBar = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final widgetList = ListView(
      shrinkWrap: true,
      controller: _controller,
      children: [
        if (widget.scrollable) SizedBox(height: topMarginSize),
        GestureDetector(
          onTap: widget.isDismissible
              ? () {
            Navigator.of(context).pop();
          }
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.hasCloseButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          color: AppColors.primaryText,
                          icon: Icon(
                            Icons.close,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              if (widget.hasCloseButton)
                SizedBox(
                  height: 16,
                ),
              Padding(
                padding: widget.padding,
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    padding: widget.contentPadding,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: widget.borderRadius,
                    ),
                    child: widget.child,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (widget.isDismissible) {
              Navigator.of(context).pop();
            }
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: widget.scrollable ? SizedBox.expand(child: widgetList) : Center(child: widgetList),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          height: MediaQuery.of(context).padding.top,
          child: Container(
            color: transparentStatusBar ? Colors.transparent : Colors.white,
          ),
        ),
      ],
    );
  }
}
