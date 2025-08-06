import 'package:flutter/widgets.dart';
import 'package:responsive_kit/src/core/responsive_kit.dart';
import 'package:responsive_kit/src/models/device_type.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({
    super.key,
    required this.child,
    this.mobile = const EdgeInsets.all(8.0),
    this.tablet = const EdgeInsets.all(16.0),
    this.desktop = const EdgeInsets.all(24.0),
    this.watch = const EdgeInsets.all(4.0),
  });

  final Widget child;
  final EdgeInsets mobile;
  final EdgeInsets tablet;
  final EdgeInsets desktop;
  final EdgeInsets watch;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveKit.of(context);

    final padding = switch (responsive.deviceType) {
      DeviceType.mobile => mobile,
      DeviceType.tablet => tablet,
      DeviceType.desktop => desktop,
      DeviceType.watch => watch,
    };

    return Padding(padding: padding, child: child);
  }
}
