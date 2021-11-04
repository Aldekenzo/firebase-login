import 'package:authtest/utils/logger.dart';
import 'package:flutter/material.dart';

class BottomSheetLayout extends StatelessWidget {
  final List<Widget>? children;
  final double topBorderRadius;
  final double? height;

  const BottomSheetLayout({
    Key? key,
    this.children,
    this.topBorderRadius = 16,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.wtf(MediaQuery.of(context).viewInsets.top,
         MediaQuery.of(context).viewInsets.bottom);
    return Container(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Wrap(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(topBorderRadius),
            ),
            child: Container(
              constraints: height != null ? BoxConstraints(
                  minHeight: height!) : null,
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: Column(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: Color(0xFFA4A4A4),
                          height: 4,
                          width: 40,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (children != null) ...children!,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
