import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'daterangepicker_theme.dart';

/// Applies a theme to descendant Syncfusion widgets.
///
/// If [SfTheme] is not specified, then based on the
/// [Theme.of(context).brightness], brightness for
/// Syncfusion widgets will be applied.
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: Center(
///       child: SfTheme(
///         data: SfThemeData(
///           chartThemeData: SfChartThemeData(
///             backgroundColor: Colors.grey,
///             brightness: Brightness.dark
///           )
///         ),
///         child: SfCartesianChart(
///         )
///       ),
///     )
///   );
/// }
/// ```
class SfTheme extends StatelessWidget {
  /// Creating an argument constructor of SfTheme class.
  const SfTheme({
    Key? key,
    this.data,
    required this.child,
  }) : super(key: key);

  /// Specifies a widget that can hold single child.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             backgroundColor: Colors.grey,
  ///             brightness: Brightness.dark
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  /// ```
  final Widget child;

  /// Specifies the color and typography values for descendant widgets.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     body: Center(
  ///       child: SfTheme(
  ///         data: SfThemeData(
  ///           chartThemeData: SfChartThemeData(
  ///             backgroundColor: Colors.grey,
  ///             brightness: Brightness.dark
  ///           )
  ///         ),
  ///         child: SfCartesianChart(
  ///         )
  ///       ),
  ///     )
  ///   );
  /// }
  /// ```
  final SfThemeData? data;

  //ignore: unused_field
  static final SfThemeData _kFallbackTheme = SfThemeData.fallback();

  /// The data from the closest [SfTheme] instance that encloses the given
  /// context.
  ///
  /// Defaults to [SfThemeData.fallback] if there is no [SfTheme] in the given
  /// build context.
  ///
  static SfThemeData of(BuildContext context) {
    final _SfInheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_SfInheritedTheme>();
    return inheritedTheme?.data ??
        (Theme.of(context).brightness == Brightness.light
            ? SfThemeData.light()
            : SfThemeData.dark());
  }

  @override
  Widget build(BuildContext context) {
    return _SfInheritedTheme(data: data, child: child);
  }
}

class _SfInheritedTheme extends InheritedTheme {
  const _SfInheritedTheme({Key? key, this.data, required Widget child})
      : super(key: key, child: child);

  final SfThemeData? data;

  @override
  bool updateShouldNotify(_SfInheritedTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final _SfInheritedTheme? ancestorTheme =
        context.findAncestorWidgetOfExactType<_SfInheritedTheme>();
    return identical(this, ancestorTheme)
        ? child
        : SfTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for light and dark themes. Use
///  this class to configure a [SfTheme] widget.
///
/// To obtain the current theme, use [SfTheme.of].
///
/// ```dart
/// Widget build(BuildContext context) {
///   return Scaffold(
///     body: Center(
///       child: SfTheme(
///         data: SfThemeData(
///           chartThemeData: SfChartThemeData(
///             backgroundColor: Colors.grey,
///             brightness: Brightness.dark
///           )
///         ),
///         child: SfCartesianChart(
///         )
///       ),
///     )
///   );
/// }
/// ```
@immutable
class SfThemeData with Diagnosticable {
  /// Creating an argument constructor of SfThemeData class.
  factory SfThemeData({
    Brightness? brightness,
    SfDateRangePickerThemeData? dateRangePickerThemeData,
  }) {
    brightness ??= Brightness.light;
    dateRangePickerThemeData = dateRangePickerThemeData ??
        SfDateRangePickerThemeData(brightness: brightness);
    return SfThemeData.raw(
      brightness: brightness,
      dateRangePickerThemeData: dateRangePickerThemeData,
    );
  }

  /// Create a [SfThemeData] given a set of exact values. All the values must be
  /// specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [SfThemeData] constructor.
  ///
  const SfThemeData.raw({
    required this.brightness,
    required this.dateRangePickerThemeData,
  });

  /// This method returns the light theme when no theme has been specified.
  factory SfThemeData.light() => SfThemeData(brightness: Brightness.light);

  /// This method is used to return the dark theme.
  factory SfThemeData.dark() => SfThemeData(brightness: Brightness.dark);

  /// The default color theme. Same as [SfThemeData.light].
  ///
  /// This is used by [SfTheme.of] when no theme has been specified.
  factory SfThemeData.fallback() => SfThemeData.light();

  /// The brightness of the overall theme of the
  /// application for the Syncusion widgets.
  ///
  /// If [brightness] is not specified, then based on the
  /// [Theme.of(context).brightness], brightness for
  /// Syncfusion widgets will be applied.
  ///
  /// Also refer [Brightness].
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            brightness: Brightness.dark
  ///          ),
  ///          child: SfCartesianChart(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Brightness brightness;

  /// Defines the default configuration of datepicker widgets.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: SfTheme(
  ///          data: SfThemeData(
  ///            dateRangePickerThemeData: SfDateRangePickerThemeData()
  ///          ),
  ///          child: SfDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final SfDateRangePickerThemeData dateRangePickerThemeData;

  /// Creates a copy of this theme but with the given
  /// fields replaced with the new values.
  SfThemeData copyWith({
    Brightness? brightness,
    SfDateRangePickerThemeData? dateRangePickerThemeData,
  }) {
    return SfThemeData.raw(
      brightness: brightness ?? this.brightness,
      dateRangePickerThemeData:
          dateRangePickerThemeData ?? this.dateRangePickerThemeData,
    );
  }

  /// Linearly interpolate between two themes.
  static SfThemeData lerp(SfThemeData? a, SfThemeData? b, double t) {
    assert(a != null);
    assert(b != null);

    return SfThemeData.raw(
      brightness: t < 0.5 ? a!.brightness : b!.brightness,
      dateRangePickerThemeData: SfDateRangePickerThemeData.lerp(
          a?.dateRangePickerThemeData, b?.dateRangePickerThemeData, t)!,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is SfThemeData &&
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
