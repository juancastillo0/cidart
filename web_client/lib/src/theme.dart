import 'package:bootstrap_dart/dark_mode/dark_mode.dart';
import 'package:mobx/mobx.dart';

class BTheme {
  static final Observable<bool> _inDarkMode = () {
    final obs = Observable<bool>(darkMode.inDarkMode);
    darkMode.inDarkModeChanges.listen((event) => obs.value = event);
    return obs;
  }();
  static bool get inDarkMode => _inDarkMode.value;

  static const String blue = '--bs-blue'; //  #0d6efd;
  static const String indigo = '--bs-indigo'; //  #6610f2;
  static const String purple = '--bs-purple'; //  #6f42c1;
  static const String pink = '--bs-pink'; //  #d63384;
  static const String red = '--bs-red'; //  #dc3545;
  static const String orange = '--bs-orange'; //  #fd7e14;
  static const String yellow = '--bs-yellow'; //  #ffc107;
  static const String green = '--bs-green'; //  #198754;
  static const String teal = '--bs-teal'; //  #20c997;
  static const String cyan = '--bs-cyan'; //  #0dcaf0;
  static const String black = '--bs-black'; //  #000;
  static const String white = '--bs-white'; //  #fff;

  static const String gray = '--bs-gray'; //  #6c757d;
  static const String grayDark = '--bs-gray-dark'; //  #343a40;
  static const String gray100 = '--bs-gray-100'; //  #f8f9fa;
  static const String gray200 = '--bs-gray-200'; //  #e9ecef;
  static const String gray300 = '--bs-gray-300'; //  #dee2e6;
  static const String gray400 = '--bs-gray-400'; //  #ced4da;
  static const String gray500 = '--bs-gray-500'; //  #adb5bd;
  static const String gray600 = '--bs-gray-600'; //  #6c757d;
  static const String gray700 = '--bs-gray-700'; //  #495057;
  static const String gray800 = '--bs-gray-800'; //  #343a40;
  static const String gray900 = '--bs-gray-900'; //  #212529;

  static const String primary = '--bs-primary'; //  #0d6efd;
  static const String secondary = '--bs-secondary'; //  #6c757d;
  static const String success = '--bs-success'; //  #198754;
  static const String info = '--bs-info'; //  #0dcaf0;
  static const String warning = '--bs-warning'; //  #ffc107;
  static const String danger = '--bs-danger'; //  #dc3545;
  static const String light = '--bs-light'; //  #f8f9fa;
  static const String dark = '--bs-dark'; //  #212529;

  static const String primaryRgb = '--bs-primary-rgb'; //  13, 110, 253;
  static const String secondaryRgb = '--bs-secondary-rgb'; //  108, 117, 125;
  static const String successRgb = '--bs-success-rgb'; //  25, 135, 84;
  static const String infoRgb = '--bs-info-rgb'; //  13, 202, 240;
  static const String warningRgb = '--bs-warning-rgb'; //  255, 193, 7;
  static const String dangerRgb = '--bs-danger-rgb'; //  220, 53, 69;
  static const String lightRgb = '--bs-light-rgb'; //  248, 249, 250;
  static const String darkRgb = '--bs-dark-rgb'; //  33, 37, 41;
  static const String whiteRgb = '--bs-white-rgb'; //  255, 255, 255;
  static const String blackRgb = '--bs-black-rgb'; //  0, 0, 0;

  static const String bodyColorRgb = '--bs-body-color-rgb'; //  33, 37, 41;
  static const String bodyBgRgb = '--bs-body-bg-rgb'; //  255, 255, 255;
  static const String fontSansSerif =
      '--bs-font-sans-serif'; //  system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", "Noto Sans", "Liberation Sans", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
  static const String fontMonospace =
      '--bs-font-monospace'; //  SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
  static const String gradient =
      '--bs-gradient'; //  linear-gradient(180deg, rgba(255, 255, 255, 0.15), rgba(255, 255, 255, 0));

  static const String bodyFontFamily =
      '--bs-body-font-family'; //  var(--bs-font-sans-serif);
  static const String bodyFontSize = '--bs-body-font-size'; //  1rem;
  static const String bodyFontWeight = '--bs-body-font-weight'; //  400;
  static const String bodyLineHeight = '--bs-body-line-height'; //  1.5;

  static const String bodyColor = '--bs-body-color'; //  #212529;
  static String get bodyBg =>
      inDarkMode ? 'var(--bs-body-bg-alt)' : 'var(--bs-body-bg)'; //  #fff;

  static String get modeColor =>
      inDarkMode ? 'var(--bs-dark)' : 'var(--bs-light)';
  static String get modeColorAlt =>
      inDarkMode ? 'var(--bs-dark-alt)' : 'var(--bs-light-alt)';
  static String get modeDarkerColor =>
      inDarkMode ? 'var(--dark-darker)' : 'var(--light-darker)';

  static const String borderWidth = '--bs-border-width'; //  1px;
  static const String borderStyle = '--bs-border-style'; //  solid;
  static const String borderColor = '--bs-border-color'; //  #dee2e6;
  static const String borderColorTranslucent =
      '--bs-border-color-translucent'; //  rgba(0, 0, 0, 0.175);

  static const String borderRadius = '--bs-border-radius'; //  0.375rem;
  static const String borderRadiusSm = '--bs-border-radius-sm'; //  0.25rem;
  static const String borderRadiusLg = '--bs-border-radius-lg'; //  0.5rem;
  static const String borderRadiusXl = '--bs-border-radius-xl'; //  1rem;
  static const String borderRadius2xl = '--bs-border-radius-2xl'; //  2rem;
  static const String borderRadiusPill = '--bs-border-radius-pill'; //  50rem;

  static const String linkColor = '--bs-link-color'; //  #0d6efd;
  static const String linkHoverColor = '--bs-link-hover-color'; //  #0a58ca;
  static const String codeColor = '--bs-code-color'; //  #d63384;
  static const String highlightBg = '--bs-highlight-bg'; //  #fff3cd;
}