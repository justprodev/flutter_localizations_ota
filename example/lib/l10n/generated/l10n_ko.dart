import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class L10nKo extends L10n {
  L10nKo([String locale = 'ko']) : super(locale);

  @override
  String get fl_ota_version => '1';

  @override
  String title(String package) {
    return '패키지\"$package\"의 사용 예';
  }

  @override
  String get currentLocaleTitle => '현재 로캘';

  @override
  String get remoteUpdateTitle => '원격 업데이트';

  @override
  String get testResource => '이 값은 테스트 리소스의 로컬 값입니다';
}
