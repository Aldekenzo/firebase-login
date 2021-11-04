import 'dart:io';

import 'package:authtest/core/colors.dart';
import 'package:authtest/widgets/modals/blurred_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<dynamic> showCloseModal(BuildContext context) => showBlurredDialog(
  transitionDuration: Duration(milliseconds: 100),
  borderRadius: BorderRadius.circular(10),
  isDismissible: true,
  hasCloseButton: false,
  contentPadding: EdgeInsets.only(
    top: 8,
  ),
  padding: EdgeInsets.symmetric(horizontal: 48),
  context: context,
  child: Column(
    children: [
      SizedBox(height: 8),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          'Закрыть приложение Aster.kz?',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ),
      SizedBox(height: 16),
      Divider(height: 1),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Platform.isIOS ? exit(0) : SystemNavigator.pop();
                },
                child: Ink(
                  padding: EdgeInsets.only(top: 12, bottom: 16, left: 8, right: 8),
                  child: Center(
                    child: Text(
                      'Закрыть',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 46,
            child: VerticalDivider(width: 1),
          ),
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(false),
                child: Ink(
                  padding: EdgeInsets.only(top: 12, bottom: 16, left: 8, right: 8),
                  child: Center(
                    child: Text(
                      'Отмена',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
