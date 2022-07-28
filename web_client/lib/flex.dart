enum AxisAlign {
  start,
  end,
  center,
  stretch,
  space_around,
  space_between,
  space_evenly,
  baseline,
}

extension MainAxisAlignExt on AxisAlign {
  String get nameHtml => toString().split('.').last.replaceAll('_', '-');
}

enum FlexWrap {
  wrap,
  wrap_reverse,
  nowrap,
}

extension FlexWrapExt on FlexWrap {
  String get nameHtml => toString().split('.').last.replaceAll('_', '-');
}

String flexStyle({
  required bool column,
  AxisAlign main = AxisAlign.start,
  AxisAlign cross = AxisAlign.center,
  FlexWrap? wrap,
}) {
  return 'display:flex;${column ? 'flex-direction:column;' : ''}'
      'justify-content:${main.nameHtml};align-items:${cross.nameHtml};'
      '${wrap == null ? '' : 'flex-wrap:${wrap.nameHtml};'}';
  // '${expand ? column ? 'height:100%;' : 'width:100%;' : ''}' ${column ? 'width:100%;' : 'height:100%;'}
}

String flexCenter({bool column = false}) {
  return flexStyle(
    main: AxisAlign.center,
    cross: AxisAlign.center,
    column: column,
  );
}
