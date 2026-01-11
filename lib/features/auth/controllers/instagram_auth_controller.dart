import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/enums/auth_view_enum.dart';

class InstagramAuthController extends GetxController implements GetxService {
  AuthView _view = AuthView.account;
  AuthView get view => _view;

  TextEditingController? _usernameCtrl;
  TextEditingController get usernameCtrl =>
      _usernameCtrl ??= TextEditingController(text: 'Sourav Barman');

  TextEditingController? _passwordCtrl;
  TextEditingController get passwordCtrl => _passwordCtrl ??= TextEditingController();

  void toForm() {
    if (_view == AuthView.form) return;
    _view = AuthView.form;
    update();
  }

  void toAccount() {
    if (_view == AuthView.account) return;
    _view = AuthView.account;
    update();
  }

  void disposeControllers() {
    _usernameCtrl?.dispose();
    _usernameCtrl = null;
    _passwordCtrl?.dispose();
    _passwordCtrl = null;
  }
}
