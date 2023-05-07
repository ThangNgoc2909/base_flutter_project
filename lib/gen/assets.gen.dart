/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_right.svg
  String get arrowRight => 'assets/icons/arrow_right.svg';

  /// File path: assets/icons/bubble_chat.svg
  String get bubbleChat => 'assets/icons/bubble_chat.svg';

  /// File path: assets/icons/ic_add.svg
  String get icAdd => 'assets/icons/ic_add.svg';

  /// File path: assets/icons/ic_add_camera.svg
  String get icAddCamera => 'assets/icons/ic_add_camera.svg';

  /// File path: assets/icons/ic_add_picture.svg
  String get icAddPicture => 'assets/icons/ic_add_picture.svg';

  /// File path: assets/icons/ic_arrow_down.svg
  String get icArrowDown => 'assets/icons/ic_arrow_down.svg';

  /// File path: assets/icons/ic_arrow_left.svg
  String get icArrowLeft => 'assets/icons/ic_arrow_left.svg';

  /// File path: assets/icons/ic_arrow_left_calendar.svg
  String get icArrowLeftCalendar => 'assets/icons/ic_arrow_left_calendar.svg';

  /// File path: assets/icons/ic_arrow_right_calendar.svg
  String get icArrowRightCalendar => 'assets/icons/ic_arrow_right_calendar.svg';

  /// File path: assets/icons/ic_arrow_up.svg
  String get icArrowUp => 'assets/icons/ic_arrow_up.svg';

  /// File path: assets/icons/ic_bell.svg
  String get icBell => 'assets/icons/ic_bell.svg';

  /// File path: assets/icons/ic_black_arrow_down.svg
  String get icBlackArrowDown => 'assets/icons/ic_black_arrow_down.svg';

  /// File path: assets/icons/ic_calendar.svg
  String get icCalendar => 'assets/icons/ic_calendar.svg';

  /// File path: assets/icons/ic_calendar_table.svg
  String get icCalendarTable => 'assets/icons/ic_calendar_table.svg';

  /// File path: assets/icons/ic_delivery_time.svg
  String get icDeliveryTime => 'assets/icons/ic_delivery_time.svg';

  /// File path: assets/icons/ic_error.svg
  String get icError => 'assets/icons/ic_error.svg';

  /// File path: assets/icons/ic_grocery_store.svg
  String get icGroceryStore => 'assets/icons/ic_grocery_store.svg';

  /// File path: assets/icons/ic_lh.svg
  String get icLh => 'assets/icons/ic_lh.svg';

  /// File path: assets/icons/ic_location.svg
  String get icLocation => 'assets/icons/ic_location.svg';

  /// File path: assets/icons/ic_mic.svg
  String get icMic => 'assets/icons/ic_mic.svg';

  /// File path: assets/icons/ic_more_menu.svg
  String get icMoreMenu => 'assets/icons/ic_more_menu.svg';

  /// File path: assets/icons/ic_person.svg
  String get icPerson => 'assets/icons/ic_person.svg';

  /// File path: assets/icons/ic_phone.svg
  String get icPhone => 'assets/icons/ic_phone.svg';

  /// File path: assets/icons/ic_qr_code.svg
  String get icQrCode => 'assets/icons/ic_qr_code.svg';

  /// File path: assets/icons/ic_search.svg
  String get icSearch => 'assets/icons/ic_search.svg';

  /// File path: assets/icons/ic_success.svg
  String get icSuccess => 'assets/icons/ic_success.svg';

  /// File path: assets/icons/ic_trash.svg
  String get icTrash => 'assets/icons/ic_trash.svg';

  /// File path: assets/icons/ic_truck.svg
  String get icTruck => 'assets/icons/ic_truck.svg';

  /// File path: assets/icons/ic_user.svg
  String get icUser => 'assets/icons/ic_user.svg';

  /// File path: assets/icons/ic_warning.svg
  String get icWarning => 'assets/icons/ic_warning.svg';

  /// List of all assets
  List<String> get values => [
        arrowRight,
        bubbleChat,
        icAdd,
        icAddCamera,
        icAddPicture,
        icArrowDown,
        icArrowLeft,
        icArrowLeftCalendar,
        icArrowRightCalendar,
        icArrowUp,
        icBell,
        icBlackArrowDown,
        icCalendar,
        icCalendarTable,
        icDeliveryTime,
        icError,
        icGroceryStore,
        icLh,
        icLocation,
        icMic,
        icMoreMenu,
        icPerson,
        icPhone,
        icQrCode,
        icSearch,
        icSuccess,
        icTrash,
        icTruck,
        icUser,
        icWarning
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
