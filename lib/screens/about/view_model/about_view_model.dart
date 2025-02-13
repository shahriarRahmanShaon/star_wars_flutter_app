import 'dart:async';
import 'package:star_wars_demo/base/view_models/base_view_model.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';

class AboutViewModel extends BaseViewModel {
  final String appVersion = AppConstants.appVersion;
  final String contactEmail = AppConstants.contactEmail;
  final String website = AppConstants.website;

  @override
  FutureOr<void> init() async {}
}
