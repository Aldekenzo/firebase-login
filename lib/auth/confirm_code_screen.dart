import 'package:authtest/arguments.dart';
import 'package:authtest/core/colors.dart';
import 'package:authtest/notifier_service.dart';
import 'package:authtest/service_locator.dart';
import 'package:authtest/stores/auth_store.dart';
import 'package:authtest/widgets/buttons/custom_button.dart';
import 'package:authtest/widgets/shadows/shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmPhoneScreen extends StatefulWidget {
  final AuthArgs authArgs;

  const ConfirmPhoneScreen({required this.authArgs, Key? key}) : super(key: key);

  @override
  State<ConfirmPhoneScreen> createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends State<ConfirmPhoneScreen> {
  // final AuthArgs authArgs;
  final AuthStore authStore = serviceLocator<AuthStore>();

  String code = '';

  bool hasError = false;

  bool loading = false;

  late TextEditingController controller = TextEditingController();

  List<String> errors = [];


  @override
  Widget build(BuildContext context) {
    final args = widget.authArgs;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 157),
                  Text(
                    'Подтвердите номер телефона',
                    style: TextStyle(
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w700,
                        fontSize: 24),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'На номер ${args.username} был отправлен\n SMS-код для подтверждения',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackText.withOpacity(0.6)),
                  ),
                  Container(
                    height: 15,
                    child: Observer(builder: (_) {
                      if (authStore.code == null)
                        return SizedBox(
                          height: 15,
                        );
                      return Text("Код: ${authStore.code!}");
                    }),
                  ),
                  SizedBox(height: 31),
                  PinCodeTextField(
                    appContext: context,
                    autoFocus: true,
                    controller: controller,
                    obscureText: false,
                    pinTheme: PinTheme(
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.transparent,
                      activeColor:
                          hasError ? AppColors.danger : Colors.transparent,
                      selectedColor: Colors.transparent,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      borderWidth: 2,
                      fieldHeight: 64,
                      fieldWidth: 45,
                    ),
                    enableActiveFill: true,
                    backgroundColor: Colors.transparent,
                    length: 6,
                    obscuringCharacter: ' ',
                    onChanged: (text) {
                      setState(() {
                        hasError = false;
                      });
                    },
                    onCompleted: handleDone,
                    boxShadows: [defaultShadow],
                    textStyle:
                        TextStyle(fontSize: 22.0, color: AppColors.primaryText),
                    animationType: AnimationType.scale,
                    animationCurve: Curves.easeInOut,
                    animationDuration: Duration(milliseconds: 100),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    text: "Далее",
                    isActive: controller.text.length == 6,
                    press: () {
                      if(controller.text.length == 6)
                        handleSubmit();
                      else{
                        serviceLocator<NotifierService>().showErrorSnackbar(context: context,
                            message: "Введите правильный код");
                      }
                    },
                  ),
                  SizedBox(height: 49)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleDone(_code) async {
    setState(() {
      code = _code;
    });
  }

  void handleSubmit() async {
    setState(() {
      loading = true;
    });

    try {
      AuthStore authStore = serviceLocator<AuthStore>();
      await authStore.checkVerifyCode(code: code);
      controller.text = '';
      if (authStore.isCodeCorrect == true) {
        await authStore.getUser(phone: authStore.phone, code: code);
        if (serviceLocator<AuthStore>().isNew == false) {
          //Navigator.pushNamedAndRemoveUntil(context, InitialRoute, (route) => false);
        } else {
          //Navigator.pushNamedAndRemoveUntil(context, AddProfileLoginRoute, (route) => false);
        }
        if (mounted) {
          setState(() {
            loading = false;
          });
        }
      } else {
        print("kate");
      }
    } on Exception {
      if (mounted) {
        setState(() {
          hasError = true;
          loading = false;
        });
      }
    }
  }

}
