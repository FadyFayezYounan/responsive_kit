import 'package:flutter/widgets.dart';
import 'package:responsive_kit/src/core/responsive_kit.dart';
import 'package:responsive_kit/src/models/device_type.dart';

class ResponsiveValue<T> extends StatelessWidget {
  const ResponsiveValue({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
    this.watch,
    required this.fallback,
    required this.builder,
  });

  final T? mobile;
  final T? tablet;
  final T? desktop;
  final T? watch;
  final T fallback;
  final Widget Function(BuildContext context, T value) builder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveKit.of(context);

    final value =
        switch (responsive.deviceType) {
          DeviceType.mobile => mobile,
          DeviceType.tablet => tablet,
          DeviceType.desktop => desktop,
          DeviceType.watch => watch,
        } ??
        fallback;

    return builder(context, value);
  }
}
