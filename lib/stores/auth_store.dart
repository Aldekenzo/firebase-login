import 'dart:convert';

import 'package:authtest/models/media-file/media-file.dart';
import 'package:authtest/models/user/only_profile.dart';
import 'package:authtest/models/user/update_profile.dart';
import 'package:authtest/models/user/user.dart';
import 'package:authtest/models/user/user_credentials.dart';
import 'package:authtest/models/user/user_phone.dart';
import 'package:authtest/network/auth_client.dart';
import 'package:authtest/network/signed_in_client.dart';
import 'package:authtest/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../notifier_service.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  _AuthStore();
  @observable
  String? phone;

  @observable
  String? code;

  @observable
  bool loading = true;

  @observable
  String? fullName;

  @observable
  String? email;

  @observable
  MediaFile? avatar;

  @observable
  int? id;
  @observable
  bool? isNew;

  @observable
  bool? isCodeCorrect;

  Future<void> checkVerifyCode({required String code}) async {
    try {
      AuthClient authClient = serviceLocator<AuthClient>();
      UserCredentials? response = await authClient
          .validate(UserPhone.fromJson({'phone': this.phone, 'code': code}));
      isCodeCorrect = response!.isCodeCorrect;
    } catch (e) {
      throw e;
    }
    loading = false;
  }

  Future<void> authByPhone({required String phone}) async {
    AuthClient authClient = serviceLocator<AuthClient>();

    String? response = await authClient.authByPhone(UserPhone.fromJson({
      'phone': phone,
    }));
    var parsedResponse = jsonDecode(response!);
    this.phone = phone;
    this.code = parsedResponse['code'];
  }


  Future<void> getUser({required String? phone, required String code}) async {
    Hive.openBox('token');
    Box tokenBox = Hive.box('token');
    SignedInClient signedInClient = serviceLocator<SignedInClient>();
    User? user = await signedInClient
        .getUser(UserPhone.fromJson({'phone': this.phone, 'code': code}));

    if (user?.token != null) {
      tokenBox.put('access', user?.token);
    }
    if (user?.isNew != null) {
      this.isNew = user?.isNew;
    }
    if (user?.fullName != null) {
      this.fullName = user?.fullName;
    }
    if (user?.email != null) {
      this.email = user?.email;
    }
    if (user?.avatar != null) {
      this.avatar = user?.avatar;
    }
    if (user?.id != null) {
      this.id = user?.id;
    }
  }

  Future<void> updateUser(
      {required String fullName,
      required String email,
      var mediaFileId}) async {
    SignedInClient signedInClient = serviceLocator<SignedInClient>();

    ProfilePage? profilePage = await signedInClient.updateUser(
        UpdateProfile.fromJson(
            {'email': email, 'fullname': fullName, 'avatar': mediaFileId}));
    if (profilePage?.fullName != null) {
      this.fullName = profilePage?.fullName;
    }
    if (profilePage?.email != null) {
      this.email = profilePage?.email;
    }
    if (profilePage?.avatar != null) {
      this.avatar = profilePage?.avatar;
    }
  }

  Future<void> getUserProfile() async {
    SignedInClient signedInClient = serviceLocator<SignedInClient>();
    try {
      User? user = await signedInClient.getUserProfile();
      if (user?.fullName != null) {
        this.fullName = user?.fullName;
      }
      if (user?.email != null) {
        this.email = user?.email;
      }
      if (user?.avatar != null) {
        this.avatar = user?.avatar;
      }
      if (user?.id != null) {
        this.id = user?.id;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        Box tokenBox = Hive.box('token');
        tokenBox.delete('access');
        serviceLocator<NotifierService>().showSnackbar(
            message: "Просим вас перезапустить приложение");
      }
    } catch (e) {
      throw e;
    }
  }
}
