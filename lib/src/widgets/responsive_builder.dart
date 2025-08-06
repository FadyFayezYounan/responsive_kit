import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_kit/src/core/responsive_kit.dart';
import 'package:responsive_kit/src/models/device_type.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
    this.watchBuilder,
    this.fallbackBuilder,
  });
  final WidgetBuilder? mobileBuilder;
  final WidgetBuilder? tabletBuilder;
  final WidgetBuilder? desktopBuilder;
  final WidgetBuilder? watchBuilder;
  final WidgetBuilder? fallbackBuilder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveKit.of(context);
    return switch (responsive.deviceType) {
          DeviceType.mobile => mobileBuilder?.call(context),
          DeviceType.tablet => tabletBuilder?.call(context),
          DeviceType.desktop => desktopBuilder?.call(context),
          DeviceType.watch => watchBuilder?.call(context),
        } ??
        fallbackBuilder?.call(context) ??
        const SizedBox.shrink();
  }
}
