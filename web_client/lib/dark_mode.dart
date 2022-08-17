import 'dart:js' as js;

const darkMode = DarkMode._();

class DarkMode {
  const DarkMode._();

  js.JsObject get _obj => js.context['darkmode'];

  void resetDarkMode() => _obj.callMethod('resetDarkMode');
  void toggleDarkMode({bool save = true}) =>
      _obj.callMethod('toggleDarkMode', [save]);
  void setDarkMode({bool toDarkMode = true, bool save = true}) =>
      _obj.callMethod('setDarkMode', [toDarkMode, save]);

  bool get inDarkMode => _obj['inDarkMode'];
  String getSavedColorScheme() => _obj.callMethod('getSavedColorScheme');
  String getPreferedColorScheme() => _obj.callMethod('getPreferedColorScheme');
  String getColorScheme() => _obj.callMethod('getColorScheme');

  // readValue
  // eraseValue
}
