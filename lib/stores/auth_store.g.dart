// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$phoneAtom = Atom(name: '_AuthStore.phone');

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$codeAtom = Atom(name: '_AuthStore.code');

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  final _$loadingAtom = Atom(name: '_AuthStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$fullNameAtom = Atom(name: '_AuthStore.fullName');

  @override
  String? get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String? value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$emailAtom = Atom(name: '_AuthStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$avatarAtom = Atom(name: '_AuthStore.avatar');

  @override
  MediaFile? get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(MediaFile? value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  final _$idAtom = Atom(name: '_AuthStore.id');

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$isNewAtom = Atom(name: '_AuthStore.isNew');

  @override
  bool? get isNew {
    _$isNewAtom.reportRead();
    return super.isNew;
  }

  @override
  set isNew(bool? value) {
    _$isNewAtom.reportWrite(value, super.isNew, () {
      super.isNew = value;
    });
  }

  final _$isCodeCorrectAtom = Atom(name: '_AuthStore.isCodeCorrect');

  @override
  bool? get isCodeCorrect {
    _$isCodeCorrectAtom.reportRead();
    return super.isCodeCorrect;
  }

  @override
  set isCodeCorrect(bool? value) {
    _$isCodeCorrectAtom.reportWrite(value, super.isCodeCorrect, () {
      super.isCodeCorrect = value;
    });
  }

  @override
  String toString() {
    return '''
phone: ${phone},
code: ${code},
loading: ${loading},
fullName: ${fullName},
email: ${email},
avatar: ${avatar},
id: ${id},
isNew: ${isNew},
isCodeCorrect: ${isCodeCorrect}
    ''';
  }
}
