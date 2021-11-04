import 'package:another_flushbar/flushbar.dart';
import 'package:authtest/core/colors.dart';
import 'package:authtest/widgets/shadows/shadows.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum SnackbarStyle {
  danger,
  success,
  info,
  basic,
}

class NotifierService {
  Flushbar? flushbar;
  Future<T?> showErrorSnackbar<T>({
    BuildContext? context,
    String? title,
    String? message,
    Widget? child,
    bool wrap = true,
    SnackbarStyle style = SnackbarStyle.basic,
    Color backgroundColor = const Color(0xFFFED5D5),
    Duration duration = const Duration(seconds: 3),
  }){
    if (flushbar != null) {
      flushbar!.dismiss();
    }
    BuildContext? _context = context;
    if (_context == null) {}
    Color _textColor = AppColors.primaryText;
    Widget? icon;

    if (style == SnackbarStyle.danger) {
      _textColor = AppColors.danger;
      icon = Icon(Icons.error, color: AppColors.danger);
    }

    if (style == SnackbarStyle.info) {
      _textColor = AppColors.primaryText;
    }

    if (style == SnackbarStyle.success) {
      icon = Icon(Icons.check, color: AppColors.success);
      _textColor = AppColors.primaryText;
    }

    flushbar = Flushbar(
      message: message,
      messageText: child == null
          ? Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (icon != null) icon,
            if (icon != null)
              SizedBox(
                width: 12,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title,
                      overflow: wrap ? null : TextOverflow.ellipsis,
                      softWrap: wrap,
                      style: Theme.of(_context!).textTheme.headline6!.copyWith(
                        color: _textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  if (message != null)
                    Text(
                      message,
                      overflow: wrap ? null : TextOverflow.ellipsis,
                      softWrap: wrap,
                      style: Theme.of(_context!).textTheme.bodyText2!.copyWith(
                        color: _textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      )
          : child,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      boxShadows: [defaultBottomSheetShadow, defaultShadow],
      isDismissible: true,
      borderRadius: BorderRadius.circular(10),
      duration: duration,
      animationDuration: Duration(milliseconds: 200),
    );

    return flushbar!.show(_context!) as Future<T?>;
  }

  Future<T?> showSnackbar<T>({
    BuildContext? context,
    String? title,
    String? message,
    Widget? child,
    bool wrap = true,
    SnackbarStyle style = SnackbarStyle.basic,
    Color backgroundColor = AppColors.kLavender,
    Duration duration = const Duration(seconds: 3),
  }) {
    if (flushbar != null) {
      flushbar!.dismiss();
    }
    BuildContext? _context = context;
    if (_context == null) {}
    Color _textColor = AppColors.primaryText;
    Widget? icon;

    if (style == SnackbarStyle.danger) {
      _textColor = AppColors.danger;
      icon = Icon(Icons.error, color: AppColors.danger);
    }

    if (style == SnackbarStyle.info) {
      _textColor = AppColors.primaryText;
    }

    if (style == SnackbarStyle.success) {
      icon = Icon(Icons.check, color: AppColors.success);
      _textColor = AppColors.primaryText;
    }

    flushbar = Flushbar(
      message: message,
      messageText: child == null
          ? Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            if (icon != null) icon,
            if (icon != null)
              SizedBox(
                width: 12,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Text(
                      title,
                      overflow: wrap ? null : TextOverflow.ellipsis,
                      softWrap: wrap,
                      style: Theme.of(_context!).textTheme.headline6!.copyWith(
                        color: _textColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  if (message != null)
                    Text(
                      message,
                      overflow: wrap ? null : TextOverflow.ellipsis,
                      softWrap: wrap,
                      style: Theme.of(_context!).textTheme.bodyText2!.copyWith(
                        color: _textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      )
          : child,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: backgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      boxShadows: [defaultBottomSheetShadow, defaultShadow],
      isDismissible: true,
      borderRadius: BorderRadius.circular(10),
      duration: duration,
      animationDuration: Duration(milliseconds: 200),
    );

    return flushbar!.show(_context!) as Future<T?>;
  }

  Future<T?>? showError<T>({
    required Exception error,
    BuildContext? context,
    String message = 'Ой! Что-то пошло не так',
  }) {
    BuildContext? _context = context;

    if (_context == null) {}

    String _message = message;

    // if (error is SignInWithAppleAuthorizationException && AuthorizationErrorCode.canceled == error.code) {
    //   return null;
    // }
    //
    // if (error is PlatformException && error.code == GoogleSignIn.kSignInCanceledError) {
    //   return null;
    // }

    if (error is DioError) {
      message = (error.response!.data is Map<String, dynamic> && error.response!.data['message'] != null) ? error.response!.data['message'] as String : _message;
    }

    return showSnackbar<T>(
      context: _context,
      message: _message,
      duration: Duration(seconds: 2),
      style: SnackbarStyle.danger,
    );
  }
}
