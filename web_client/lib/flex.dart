// ignore_for_file: constant_identifier_names

import 'package:web_client/prelude.dart';

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

enum FlexDirection {
  row,
  column,
}

extension FlexWrapExt on FlexWrap {
  String get nameHtml => toString().split('.').last.replaceAll('_', '-');
}

String flexStyle({
  required FlexDirection direction,
  AxisAlign main = AxisAlign.start,
  AxisAlign cross = AxisAlign.center,
  FlexWrap? wrap,
}) {
  return 'display:flex;flex-direction:${direction.name};'
      'justify-content:${main.nameHtml};align-items:${cross.nameHtml};'
      '${wrap == null ? '' : 'flex-wrap:${wrap.nameHtml};'}';
  // '${expand ? column ? 'height:100%;' : 'width:100%;' : ''}' ${column ? 'width:100%;' : 'height:100%;'}
}

String flexCenter(FlexDirection direction) {
  return flexStyle(
    main: AxisAlign.center,
    cross: AxisAlign.center,
    direction: direction,
  );
}

class Col extends StatelessObserverComponent {
  const Col(
    this.children, {
    super.key,
    this.main = AxisAlign.start,
    this.cross = AxisAlign.center,
    this.wrap,
    this.styles,
  });

  final List<Component> children;
  final AxisAlign main;
  final AxisAlign cross;
  final FlexWrap? wrap;
  final Styles? styles;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      attributes: {
        'style': flexStyle(
              direction: FlexDirection.column,
              cross: cross,
              main: main,
              wrap: wrap,
            ) +
            _stylesToCssString(styles)
      },
      children,
    );
  }
}

class Row extends StatelessObserverComponent {
  const Row(
    this.children, {
    super.key,
    this.main = AxisAlign.start,
    this.cross = AxisAlign.center,
    this.wrap,
    this.styles,
  });

  final List<Component> children;
  final AxisAlign main;
  final AxisAlign cross;
  final FlexWrap? wrap;
  final Styles? styles;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      attributes: {
        'style': flexStyle(
              direction: FlexDirection.row,
              cross: cross,
              main: main,
              wrap: wrap,
            ) +
            _stylesToCssString(styles)
      },
      children,
    );
  }
}

String _stylesToCssString(Styles? styles) =>
    styles?.styles.entries.map((e) => '${e.key}:${e.value};').join() ?? '';
