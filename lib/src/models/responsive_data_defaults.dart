import 'package:flutter/widgets.dart';
import 'package:responsive_kit/src/models/models.exports.dart';

final class ResponsiveDataDefaults extends ResponsiveData {
  ResponsiveDataDefaults(this.context)
    : super(breakpoints: ResponsiveBreakpoints.defaults());

  ResponsiveDataDefaults.withBreakpoints(
    this.context,
    ResponsiveBreakpoints breakpoints,
  ) : super(breakpoints: breakpoints);

  final BuildContext context;
  late final Size _screenSize = MediaQuery.sizeOf(context);

  @override
  Size get screenSize => _screenSize;

  @override
  DeviceType get deviceType => DeviceType.detectWithPlatform(
    size: _screenSize,
    breakpoints: breakpoints,
  );
}
