import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'daterangepicker_theme.dart';

/// Applies a theme to descendant Syncfusion widgets.
///
/// If [CustomTheme] is not specified, then based on the
/// [Theme.of(context).brightness], brightness for
/// Syncfusion widgets will be applied.
///
class CustomTheme extends StatelessWidget {
  /// Creating an argument constructor of CustomTheme class.
  const CustomTheme({
    Key? key,
    this.data,
    required this.child,
  }) : super(key: key);

  /// Specifies a widget that can hold single child.
  final Widget child;

  /// Specifies the color and typography values for descendant widgets.
  final CustomThemeData? data;

  //ignore: unused_field
  static final CustomThemeData _kFallbackTheme = CustomThemeData.fallback();

  /// The data from the closest [CustomTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [CustomThemeData.fallback] if there is no [CustomTheme] in the given
  /// build context.
  ///
  static CustomThemeData of(BuildContext context) {
    final _CustomInheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_CustomInheritedTheme>();
    return inheritedTheme?.data ??
        (Theme.of(context).brightness == Brightness.light
            ? CustomThemeData.light()
            : CustomThemeData.dark());
  }

  @override
  Widget build(BuildContext context) {
    return _CustomInheritedTheme(data: data, child: child);
  }
}

class _CustomInheritedTheme extends InheritedTheme {
  const _CustomInheritedTheme({Key? key, this.data, required Widget child})
      : super(key: key, child: child);

  final CustomThemeData? data;

  @override
  bool updateShouldNotify(_CustomInheritedTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final _CustomInheritedTheme? ancestorTheme =
        context.findAncestorWidgetOfExactType<_CustomInheritedTheme>();
    return identical(this, ancestorTheme)
        ? child
        : CustomTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for light and dark themes. Use
///  this class to configure a [CustomTheme] widget.
///
/// To obtain the current theme, use [CustomTheme.of].
///
@immutable
class CustomThemeData with Diagnosticable {
  /// Creating an argument constructor of CustomThemeData class.
  factory CustomThemeData({
    Brightness? brightness,
    CustomDateRangePickerThemeData? dateRangePickerThemeData,
  }) {
    brightness ??= Brightness.light;
    dateRangePickerThemeData = dateRangePickerThemeData ??
        CustomDateRangePickerThemeData(brightness: brightness);
    return CustomThemeData.raw(
      brightness: brightness,
      dateRangePickerThemeData: dateRangePickerThemeData,
    );
  }

  /// Create a [CustomThemeData] given a set of exact values. All the values must be
  /// specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [CustomThemeData] constructor.
  ///
  const CustomThemeData.raw({
    required this.brightness,
    required this.dateRangePickerThemeData,
  });

  /// This method returns the light theme when no theme has been specified.
  factory CustomThemeData.light() =>
      CustomThemeData(brightness: Brightness.light);

  /// This method is used to return the dark theme.
  factory CustomThemeData.dark() =>
      CustomThemeData(brightness: Brightness.dark);

  /// The default color theme. Same as [CustomThemeData.light].
  ///
  /// This is used by [CustomTheme.of] when no theme has been specified.
  factory CustomThemeData.fallback() => CustomThemeData.light();

  /// The brightness of the overall theme of the
  /// application for the Syncusion widgets.
  ///
  /// If [brightness] is not specified, then based on the
  /// [Theme.of(context).brightness], brightness for
  /// Syncfusion widgets will be applied.
  ///
  /// Also refer [Brightness].
  ///
  final Brightness brightness;

  /// Defines the default configuration of datepicker widgets.
  ///
  final CustomDateRangePickerThemeData dateRangePickerThemeData;

  /// Creates a copy of this theme but with the given
  /// fields replaced with the new values.
  CustomThemeData copyWith({
    Brightness? brightness,
    CustomDateRangePickerThemeData? dateRangePickerThemeData,
  }) {
    return CustomThemeData.raw(
      brightness: brightness ?? this.brightness,
      dateRangePickerThemeData:
          dateRangePickerThemeData ?? this.dateRangePickerThemeData,
    );
  }

  /// Linearly interpolate between two themes.
  static CustomThemeData lerp(
      CustomThemeData? a, CustomThemeData? b, double t) {
    assert(a != null);
    assert(b != null);

    return CustomThemeData.raw(
      brightness: t < 0.5 ? a!.brightness : b!.brightness,
      dateRangePickerThemeData: CustomDateRangePickerThemeData.lerp(
          a?.dateRangePickerThemeData, b?.dateRangePickerThemeData, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is CustomThemeData &&
        other.brightness == brightness &&
        other.dateRangePickerThemeData == dateRangePickerThemeData;
  }

  @override
  int get hashCode {
    final List<Object> values = <Object>[
      brightness,
      dateRangePickerThemeData,
    ];
    return hashList(values);
  }
}
