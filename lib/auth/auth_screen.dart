import 'package:authtest/arguments.dart';
import 'package:authtest/core/colors.dart';
import 'package:authtest/notifier_service.dart';
import 'package:authtest/routing_const.dart';
import 'package:authtest/service_locator.dart';
import 'package:authtest/stores/auth_store.dart';
import 'package:authtest/widgets/buttons/custom_button.dart';
import 'package:authtest/widgets/form/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  String phone = '';
  String email = '';
  bool loading = false;
  bool loadingGoogle = false;
  bool loadingApple = false;
  MultiValidator validator = MultiValidator([
    RequiredValidator(errorText: 'Необходимо ввести номер телефона'),
    PatternValidator(r'(\+7\d{3}\d{3}\d{2}\d{2})',
        errorText: 'Введите корректный номер телефона')
  ]);
  final phoneFormatter = MaskTextInputFormatter(
    mask: '+7##########',
    filter: {"#": RegExp(r'[0-9]')},
  );
  int someval = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    register();
  }

  Future<void> register() async {
    await serviceLocator.allReady();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
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
                      'Вход в Oshaq',
                      style: TextStyle(
                          fontSize: 32,
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Для авторизации или регистрации введите \n Ваш номер телефона',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.blackText.withOpacity(0.6),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    CustomTextField(
                      controller: controller,
                      labelText: "Телефон",
                      hintText: "+77 - - - - - - - - -",
                      onChange: (value) {
                        setState(() {
                          someval = controller.text.length;
                        });
                        if (controller.text.length == 12)
                        setState(() {
                          phone = value;
                          FocusScope.of(context).requestFocus(new FocusNode());
                        });
                      },
                      formatter: [phoneFormatter],
                      textInputType: TextInputType.phone,
                      validator: validator
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Пользовательское соглашение",
                          style: TextStyle(
                              color: AppColors.blackText.withOpacity(0.6),
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        )),
                    SizedBox(height: 22),
                    CustomButton(
                        text: "Далее",
                        isActive: someval == 12,
                        press: () {
                          if(someval == 12) {
                            navigateToCode();
                          } else{
                            serviceLocator<NotifierService>().showErrorSnackbar(context: context,
                            message: "Введите правильный номер");
                          }
                        }),
                    SizedBox(
                      height: 49,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigateToCode() async {
    if (phone.isEmpty) {
      serviceLocator<NotifierService>()
          .showError(error: Exception('Заполните номер'));
    } else {
      AuthStore authStore = serviceLocator<AuthStore>();
      await authStore.authByPhone(phone: phone);

        Navigator.pushNamed(
          context,
          ConfirmCodeRoute,
          arguments: AuthArgs(
            username: phone,
          ),
        );


    }
  }
}
