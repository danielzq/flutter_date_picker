import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'theme_widget.dart';

/// Applies a theme to descendant Syncfusion date range picker widgets.
///
/// ```dart
/// Widget build(BuildContext context) {
///  return Scaffold(
///     body: CustomDateRangePickerTheme(
///       data: CustomDateRangePickerThemeData(
///         backgroundColor: Colors.grey,
///         brightness: Brightness.dark,
///       ),
///       child: CustomDateRangePicker()
///     ),
///   );
/// }
/// ```
class CustomDateRangePickerTheme extends InheritedTheme {
  /// Constructor for teh calendar theme class, which applies a theme to
  /// descendant Syncfusion date range picker widgets.
  const CustomDateRangePickerTheme(
      {Key? key, required this.data, required this.child})
      : super(key: key, child: child);

  /// Specifies the color and typography values for descendant chart widgets.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///     body: CustomDateRangePickerTheme(
  ///       data: CustomDateRangePickerThemeData(
  ///         backgroundColor: Colors.grey,
  ///         brightness: Brightness.dark,
  ///       ),
  ///       child: CustomDateRangePicker()
  ///     ),
  ///   );
  /// }
  /// ```
  final CustomDateRangePickerThemeData data;

  /// Specifies a widget that can hold single child.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///     body: CustomDateRangePickerTheme(
  ///       data: CustomDateRangePickerThemeData(
  ///         backgroundColor: Colors.grey,
  ///         brightness: Brightness.dark,
  ///       ),
  ///       child: CustomDateRangePicker()
  ///     ),
  ///   );
  /// }
  /// ```
  @override
  final Widget child;

  /// The data from the closest [CustomDateRangePickerTheme] instance
  /// that encloses the given context.
  ///
  /// Defaults to [CustomThemeData.dateRangePickerTheme] if there is no
  /// [CustomDateRangePickerTheme] in the given build context.
  static CustomDateRangePickerThemeData of(BuildContext context) {
    final CustomDateRangePickerTheme? customDateRangePickerTheme = context
        .dependOnInheritedWidgetOfExactType<CustomDateRangePickerTheme>();
    return customDateRangePickerTheme?.data ??
        CustomTheme.of(context).dateRangePickerThemeData;
  }

  @override
  bool updateShouldNotify(CustomDateRangePickerTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final CustomDateRangePickerTheme? ancestorTheme =
        context.findAncestorWidgetOfExactType<CustomDateRangePickerTheme>();
    return identical(this, ancestorTheme)
        ? child
        : CustomDateRangePickerTheme(data: data, child: child);
  }
}

/// Holds the color and typography values for a [CustomDateRangePickerTheme]. Use
///  this class to configure a [CustomDateRangePickerTheme] widget
///
/// To obtain the current theme, use [CustomDateRangePickerTheme.of].
///
/// ```dart
/// Widget build(BuildContext context) {
///  return Scaffold(
///     body: CustomDateRangePickerTheme(
///       data: CustomDateRangePickerThemeData(
///         backgroundColor: Colors.grey,
///         brightness: Brightness.dark,
///       ),
///       child: CustomDateRangePicker()
///     ),
///   );
/// }
/// ```
@immutable
class CustomDateRangePickerThemeData with Diagnosticable {
  /// Create a [CustomDateRangePickerThemeData] that's used to configure a
  /// [CustomDateRangePickerTheme].
  factory CustomDateRangePickerThemeData({
    Brightness? brightness,
    Color? backgroundColor,
    Color? startRangeSelectionColor,
    Color? endRangeSelectionColor,
    Color? headerBackgroundColor,
    Color? viewHeaderBackgroundColor,
    Color? todayHighlightColor,
    Color? selectionColor,
    Color? rangeSelectionColor,
    Color? weekNumberBackgroundColor,
    TextStyle? viewHeaderTextStyle,
    TextStyle? headerTextStyle,
    TextStyle? trailingDatesTextStyle,
    TextStyle? leadingCellTextStyle,
    TextStyle? activeDatesTextStyle,
    TextStyle? cellTextStyle,
    TextStyle? rangeSelectionTextStyle,
    TextStyle? leadingDatesTextStyle,
    TextStyle? disabledDatesTextStyle,
    TextStyle? disabledCellTextStyle,
    TextStyle? selectionTextStyle,
    TextStyle? blackoutDatesTextStyle,
    TextStyle? todayTextStyle,
    TextStyle? todayCellTextStyle,
    TextStyle? weekendDatesTextStyle,
    TextStyle? specialDatesTextStyle,
    TextStyle? weekNumberTextStyle,
  }) {
    brightness = brightness ?? Brightness.light;
    final bool isLight = brightness == Brightness.light;
    backgroundColor ??= Colors.transparent;
    headerBackgroundColor ??= Colors.transparent;
    viewHeaderBackgroundColor ??= Colors.transparent;
    weekNumberBackgroundColor = Colors.grey.withOpacity(0.19);
    viewHeaderTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 11, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 11, fontFamily: 'Roboto');
    headerTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 16, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'Roboto');
    trailingDatesTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black54, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white54, fontSize: 13, fontFamily: 'Roboto');
    leadingCellTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black54, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white54, fontSize: 13, fontFamily: 'Roboto');
    activeDatesTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: 'Roboto');
    cellTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: 'Roboto');
    leadingDatesTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black54, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white54, fontSize: 13, fontFamily: 'Roboto');
    rangeSelectionTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: 'Roboto');
    disabledDatesTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black26, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white38, fontSize: 13, fontFamily: 'Roboto');
    disabledCellTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.black26, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white38, fontSize: 13, fontFamily: 'Roboto');
    selectionTextStyle ??= isLight
        ? const TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.black, fontSize: 13, fontFamily: 'Roboto');
    todayTextStyle ??= isLight
        ? const TextStyle(fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(fontSize: 13, fontFamily: 'Roboto');
    todayCellTextStyle ??= isLight
        ? const TextStyle(fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(fontSize: 13, fontFamily: 'Roboto');
    specialDatesTextStyle ??= isLight
        ? const TextStyle(
            color: Color(0xFF339413), fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Color(0xFFEA75FF), fontSize: 13, fontFamily: 'Roboto');
    weekNumberTextStyle = isLight
        ? const TextStyle(
            color: Colors.black87, fontSize: 13, fontFamily: 'Roboto')
        : const TextStyle(
            color: Colors.white, fontSize: 13, fontFamily: 'Roboto');

    return CustomDateRangePickerThemeData.raw(
        brightness: brightness,
        backgroundColor: backgroundColor,
        viewHeaderTextStyle: viewHeaderTextStyle,
        headerTextStyle: headerTextStyle,
        trailingDatesTextStyle: trailingDatesTextStyle,
        leadingCellTextStyle: leadingCellTextStyle,
        activeDatesTextStyle: activeDatesTextStyle,
        cellTextStyle: cellTextStyle,
        rangeSelectionTextStyle: rangeSelectionTextStyle,
        rangeSelectionColor: rangeSelectionColor,
        weekNumberBackgroundColor: weekNumberBackgroundColor,
        leadingDatesTextStyle: leadingDatesTextStyle,
        disabledDatesTextStyle: disabledDatesTextStyle,
        disabledCellTextStyle: disabledCellTextStyle,
        selectionColor: selectionColor,
        selectionTextStyle: selectionTextStyle,
        startRangeSelectionColor: startRangeSelectionColor,
        endRangeSelectionColor: endRangeSelectionColor,
        headerBackgroundColor: headerBackgroundColor,
        viewHeaderBackgroundColor: viewHeaderBackgroundColor,
        blackoutDatesTextStyle: blackoutDatesTextStyle,
        todayHighlightColor: todayHighlightColor,
        todayTextStyle: todayTextStyle,
        todayCellTextStyle: todayCellTextStyle,
        weekendDatesTextStyle: weekendDatesTextStyle,
        specialDatesTextStyle: specialDatesTextStyle,
        weekNumberTextStyle: weekNumberTextStyle);
  }

  /// Create a [CustomDateRangePickerThemeData] given a set of exact values.
  /// All the values must be specified.
  ///
  /// This will rarely be used directly. It is used by [lerp] to
  /// create intermediate themes based on two themes created with the
  /// [CustomDateRangePickerThemeData] constructor.
  const CustomDateRangePickerThemeData.raw(
      {required this.brightness,
      required this.backgroundColor,
      required this.viewHeaderTextStyle,
      required this.headerTextStyle,
      required this.trailingDatesTextStyle,
      required this.leadingCellTextStyle,
      required this.activeDatesTextStyle,
      required this.cellTextStyle,
      required this.rangeSelectionTextStyle,
      required this.rangeSelectionColor,
      required this.leadingDatesTextStyle,
      required this.disabledDatesTextStyle,
      required this.disabledCellTextStyle,
      required this.selectionColor,
      required this.selectionTextStyle,
      required this.startRangeSelectionColor,
      required this.endRangeSelectionColor,
      required this.headerBackgroundColor,
      required this.viewHeaderBackgroundColor,
      required this.weekNumberBackgroundColor,
      required this.blackoutDatesTextStyle,
      required this.todayHighlightColor,
      required this.todayTextStyle,
      required this.todayCellTextStyle,
      required this.weekendDatesTextStyle,
      required this.specialDatesTextStyle,
      required this.weekNumberTextStyle});

  /// The brightness of the overall theme of the
  /// application for the date picker widget.
  ///
  /// If [brightness] is not specified, then based on the
  /// [Theme.of(context).brightness], brightness for
  /// date range picker widgets will be applied.
  ///
  /// Also refer [Brightness].
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     appBar: AppBar(),
  ///     body: Center(
  ///       child: CustomTheme(
  ///         data: CustomThemeData(
  ///           dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///             brightness: Brightness.light
  ///           )
  ///         ),
  ///         child: CustomDateRangePicker(),
  ///       ),
  ///     )
  ///   );
  /// }
  /// ```
  final Brightness brightness;

  /// Specifies the background color of date picker widget.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     appBar: AppBar(),
  ///       body: Center(
  ///         child: CustomTheme(
  ///           data: CustomThemeData(
  ///             dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///               backgroundColor: Colors.grey
  ///             )
  ///           ),
  ///           child: CustomDateRangePicker(),
  ///         ),
  ///       )
  ///   );
  /// }
  /// ```
  final Color backgroundColor;

  /// Specify the date picker view header text style in month view.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     appBar: AppBar(),
  ///       body: Center(
  ///         child: CustomTheme(
  ///           data: CustomThemeData(
  ///             dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///               viewHeaderTextStyle: TextStyle(backgroundColor:
  ///                 Colors.greenAccent)
  ///             )
  ///           ),
  ///           child: CustomDateRangePicker(),
  ///         ),
  ///       )
  ///   );
  /// }
  /// ```
  final TextStyle viewHeaderTextStyle;

  /// Specify the date picker header text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              headerTextStyle: TextStyle(fontSize: 14)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle headerTextStyle;

  /// Specify the date picker trailing dates cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              trailingDatesTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle trailingDatesTextStyle;

  /// Specify the date picker leading year, decade or century cell text style
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              leadingCellTextStyle: TextStyle(color: Colors.red,
  ///                backgroundColor: Colors.green)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle leadingCellTextStyle;

  /// Specify the date picker current month cells text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              activeDatesTextStyle: TextStyle(color: Colors.grey)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle activeDatesTextStyle;

  /// Specify the date picker current year, decade or century cells text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              cellTextStyle: TextStyle(color: Colors.blueAccent)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle cellTextStyle;

  /// Specify the date picker in-between selected range text style in month
  /// view when selection mode as range/multi-range selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              rangeSelectionTextStyle: TextStyle(decoration:
  ///                TextDecoration.lineThrough)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle rangeSelectionTextStyle;

  /// Specify the date picker leading dates cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              leadingDatesTextStyle: TextStyle(color: Colors.red)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle leadingDatesTextStyle;

  /// Specify the date picker disabled cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              disabledDatesTextStyle: TextStyle(color:Colors.tealAccent)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle disabledDatesTextStyle;

  /// Specify the date picker disabled year, decade or century cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              disabledCellTextStyle: TextStyle(color: Colors.yellowAccent),
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle disabledCellTextStyle;

  /// Specify the date picker selected dates background color in
  /// month view single and multiple selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              selectionColor: Colors.pinkAccent
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? selectionColor;

  /// Specify the date picker in-between selected range background color in
  /// month view when selection mode as range/multi-range selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              rangeSelectionColor: Colors.cyan
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? rangeSelectionColor;

  /// Specify the background color of the week number panel in month view.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              weekNumberBackgroundColor: Colors.blue,
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? weekNumberBackgroundColor;

  /// Specify the date picker selected cell text style for the  single and
  /// multiple selection and also for the start and end range of single
  /// and multi-range selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              selectionTextStyle: TextStyle(decoration:
  ///                TextDecoration.overline)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle selectionTextStyle;

  /// Specify the date picker start date of selected range background color
  /// in month view when selection mode as range/multi-range selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              startRangeSelectionColor: Colors.green
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? startRangeSelectionColor;

  /// Specify the date picker end date of selected range background color
  /// in month view when selection mode as range/multi-range selection.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              endRangeSelectionColor: Colors.green
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? endRangeSelectionColor;

  /// Specify the date picker header background color.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              headerBackgroundColor: Colors.purple
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color headerBackgroundColor;

  /// Specify the view header background color in month view.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              viewHeaderBackgroundColor: Colors.purpleAccent
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color viewHeaderBackgroundColor;

  /// Specify the date picker blackout cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              blackoutDatesTextStyle: TextStyle(color:Colors.green[300])
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle? blackoutDatesTextStyle;

  /// Specify the date picker today highlight color.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              todayHighlightColor: Colors.red
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final Color? todayHighlightColor;

  /// Specify the date picker today date month cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              todayTextStyle: TextStyle(backgroundColor: Colors.yellow)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle todayTextStyle;

  /// Specify the date picker today month, decade or century cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              todayCellTextStyle: TextStyle(fontWeight: FontWeight.bold)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle todayCellTextStyle;

  /// Specify the date picker weekend cell text style.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              weekendDatesTextStyle: TextStyle(fontWeight: FontWeight.bold,
  ///                decoration: TextDecoration.lineThrough)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle? weekendDatesTextStyle;

  /// Specify the date picker special dates text style in month view
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              specialDatesTextStyle: TextStyle(color: Colors.orange)
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle specialDatesTextStyle;

  /// Specifies the text style for the week number text in month view.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///  return Scaffold(
  ///    appBar: AppBar(),
  ///      body: Center(
  ///        child: CustomTheme(
  ///          data: CustomThemeData(
  ///            dateRangePickerThemeData: CustomDateRangePickerThemeData(
  ///              weekNumberBackgroundColor: Colors.blue,
  ///              weekNumberTextStyle: TextStyle(color: Colors.grey,
  ///              fontSize: 20),
  ///            )
  ///          ),
  ///          child: CustomDateRangePicker(),
  ///        ),
  ///      )
  ///   );
  /// }
  /// ```
  final TextStyle weekNumberTextStyle;

  /// Creates a copy of this theme but with the given
  /// fields replaced with the new values.
  CustomDateRangePickerThemeData copyWith({
    Brightness? brightness,
    TextStyle? viewHeaderTextStyle,
    Color? backgroundColor,
    TextStyle? headerTextStyle,
    TextStyle? trailingDatesTextStyle,
    TextStyle? leadingCellTextStyle,
    TextStyle? activeDatesTextStyle,
    TextStyle? cellTextStyle,
    TextStyle? rangeSelectionTextStyle,
    TextStyle? leadingDatesTextStyle,
    TextStyle? disabledDatesTextStyle,
    TextStyle? disabledCellTextStyle,
    Color? selectionColor,
    Color? rangeSelectionColor,
    Color? weekNumberBackgroundColor,
    TextStyle? selectionTextStyle,
    Color? startRangeSelectionColor,
    Color? endRangeSelectionColor,
    Color? headerBackgroundColor,
    Color? viewHeaderBackgroundColor,
    TextStyle? blackoutDatesTextStyle,
    Color? todayHighlightColor,
    TextStyle? todayTextStyle,
    TextStyle? todayCellTextStyle,
    TextStyle? weekendDatesTextStyle,
    TextStyle? specialDatesTextStyle,
    TextStyle? weekNumberTextStyle,
  }) {
    return CustomDateRangePickerThemeData.raw(
      brightness: brightness ?? this.brightness,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      viewHeaderTextStyle: viewHeaderTextStyle ?? this.viewHeaderTextStyle,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      trailingDatesTextStyle:
          trailingDatesTextStyle ?? this.trailingDatesTextStyle,
      leadingCellTextStyle: leadingCellTextStyle ?? this.leadingCellTextStyle,
      activeDatesTextStyle: activeDatesTextStyle ?? this.activeDatesTextStyle,
      cellTextStyle: cellTextStyle ?? this.cellTextStyle,
      rangeSelectionTextStyle:
          rangeSelectionTextStyle ?? this.rangeSelectionTextStyle,
      rangeSelectionColor: rangeSelectionColor ?? this.rangeSelectionColor,
      weekNumberBackgroundColor:
          weekNumberBackgroundColor ?? this.weekNumberBackgroundColor,
      leadingDatesTextStyle:
          leadingDatesTextStyle ?? this.leadingDatesTextStyle,
      disabledDatesTextStyle:
          disabledDatesTextStyle ?? this.disabledDatesTextStyle,
      disabledCellTextStyle:
          disabledCellTextStyle ?? this.disabledCellTextStyle,
      selectionColor: selectionColor ?? this.selectionColor,
      selectionTextStyle: selectionTextStyle ?? this.selectionTextStyle,
      startRangeSelectionColor:
          startRangeSelectionColor ?? this.startRangeSelectionColor,
      endRangeSelectionColor:
          endRangeSelectionColor ?? this.endRangeSelectionColor,
      headerBackgroundColor:
          headerBackgroundColor ?? this.headerBackgroundColor,
      viewHeaderBackgroundColor:
          viewHeaderBackgroundColor ?? this.viewHeaderBackgroundColor,
      blackoutDatesTextStyle:
          blackoutDatesTextStyle ?? this.blackoutDatesTextStyle,
      todayHighlightColor: todayHighlightColor ?? this.todayHighlightColor,
      todayTextStyle: todayTextStyle ?? this.todayTextStyle,
      todayCellTextStyle: todayCellTextStyle ?? this.todayCellTextStyle,
      weekendDatesTextStyle:
          weekendDatesTextStyle ?? this.weekendDatesTextStyle,
      specialDatesTextStyle:
          specialDatesTextStyle ?? this.specialDatesTextStyle,
      weekNumberTextStyle: weekNumberTextStyle ?? this.weekNumberTextStyle,
    );
  }

  /// Linearly interpolate between two themes.
  static CustomDateRangePickerThemeData? lerp(CustomDateRangePickerThemeData? a,
      CustomDateRangePickerThemeData? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    return CustomDateRangePickerThemeData(
      backgroundColor: Color.lerp(a!.backgroundColor, b!.backgroundColor, t),
      rangeSelectionColor:
          Color.lerp(a.rangeSelectionColor, b.rangeSelectionColor, t),
      selectionColor: Color.lerp(a.selectionColor, b.selectionColor, t),
      startRangeSelectionColor:
          Color.lerp(a.startRangeSelectionColor, b.startRangeSelectionColor, t),
      endRangeSelectionColor:
          Color.lerp(a.endRangeSelectionColor, b.endRangeSelectionColor, t),
      headerBackgroundColor:
          Color.lerp(a.headerBackgroundColor, b.headerBackgroundColor, t),
      viewHeaderBackgroundColor: Color.lerp(
          a.viewHeaderBackgroundColor, b.viewHeaderBackgroundColor, t),
      todayHighlightColor:
          Color.lerp(a.todayHighlightColor, b.todayHighlightColor, t),
      weekNumberBackgroundColor: Color.lerp(
          a.weekNumberBackgroundColor, b.weekNumberBackgroundColor, t),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is CustomDateRangePickerThemeData &&
        other.viewHeaderTextStyle == viewHeaderTextStyle &&
        other.backgroundColor == backgroundColor &&
        other.headerTextStyle == headerTextStyle &&
        other.trailingDatesTextStyle == trailingDatesTextStyle &&
        other.leadingCellTextStyle == leadingCellTextStyle &&
        other.activeDatesTextStyle == activeDatesTextStyle &&
        other.cellTextStyle == cellTextStyle &&
        other.rangeSelectionTextStyle == rangeSelectionTextStyle &&
        other.rangeSelectionColor == rangeSelectionColor &&
        other.weekNumberBackgroundColor == weekNumberBackgroundColor &&
        other.leadingDatesTextStyle == leadingDatesTextStyle &&
        other.disabledDatesTextStyle == disabledDatesTextStyle &&
        other.disabledCellTextStyle == disabledCellTextStyle &&
        other.selectionColor == selectionColor &&
        other.selectionTextStyle == selectionTextStyle &&
        other.startRangeSelectionColor == startRangeSelectionColor &&
        other.endRangeSelectionColor == endRangeSelectionColor &&
        other.headerBackgroundColor == headerBackgroundColor &&
        other.viewHeaderBackgroundColor == viewHeaderBackgroundColor &&
        other.blackoutDatesTextStyle == blackoutDatesTextStyle &&
        other.todayHighlightColor == todayHighlightColor &&
        other.todayTextStyle == todayTextStyle &&
        other.todayCellTextStyle == todayCellTextStyle &&
        other.weekendDatesTextStyle == weekendDatesTextStyle &&
        other.specialDatesTextStyle == specialDatesTextStyle &&
        other.weekNumberTextStyle == weekNumberTextStyle;
  }

  @override
  int get hashCode {
    final List<Object?> values = <Object?>[
      viewHeaderTextStyle,
      backgroundColor,
      headerTextStyle,
      trailingDatesTextStyle,
      leadingCellTextStyle,
      activeDatesTextStyle,
      cellTextStyle,
      rangeSelectionTextStyle,
      rangeSelectionColor,
      weekNumberBackgroundColor,
      leadingDatesTextStyle,
      disabledDatesTextStyle,
      disabledCellTextStyle,
      selectionColor,
      selectionTextStyle,
      startRangeSelectionColor,
      endRangeSelectionColor,
      headerBackgroundColor,
      viewHeaderBackgroundColor,
      blackoutDatesTextStyle,
      todayHighlightColor,
      todayTextStyle,
      todayCellTextStyle,
      weekendDatesTextStyle,
      specialDatesTextStyle,
      weekNumberTextStyle
    ];
    return hashList(values);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    final CustomDateRangePickerThemeData defaultData =
        CustomDateRangePickerThemeData();
    properties.add(EnumProperty<Brightness>('brightness', brightness,
        defaultValue: defaultData.brightness));
    properties.add(ColorProperty('backgroundColor', backgroundColor,
        defaultValue: defaultData.backgroundColor));
    properties.add(ColorProperty('rangeSelectionColor', rangeSelectionColor,
        defaultValue: defaultData.rangeSelectionColor));
    properties.add(ColorProperty(
        'weekNumberBackgroundColor', weekNumberBackgroundColor,
        defaultValue: defaultData.weekNumberBackgroundColor));
    properties.add(ColorProperty('selectionColor', selectionColor,
        defaultValue: defaultData.selectionColor));
    properties.add(ColorProperty(
        'startRangeSelectionColor', startRangeSelectionColor,
        defaultValue: defaultData.startRangeSelectionColor));
    properties.add(ColorProperty(
        'endRangeSelectionColor', endRangeSelectionColor,
        defaultValue: defaultData.endRangeSelectionColor));
    properties.add(ColorProperty('headerBackgroundColor', headerBackgroundColor,
        defaultValue: defaultData.headerBackgroundColor));
    properties.add(ColorProperty(
        'viewHeaderBackgroundColor', viewHeaderBackgroundColor,
        defaultValue: defaultData.viewHeaderBackgroundColor));
    properties.add(ColorProperty('todayHighlightColor', todayHighlightColor,
        defaultValue: defaultData.todayHighlightColor));
  }
}
