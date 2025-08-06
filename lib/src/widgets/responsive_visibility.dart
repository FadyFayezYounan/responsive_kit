import 'package:flutter/widgets.dart';
import 'package:responsive_kit/src/core/responsive_kit.dart';
import 'package:responsive_kit/src/models/device_type.dart';

/// A widget that conditionally shows its child based on device type.
class ResponsiveVisibility extends StatelessWidget {
  /// Creates a responsive visibility widget.
  ///
  /// The [child] will only be visible if at least one of the visibility
  /// flags ([visibleOn]) matches the current device type.
  const ResponsiveVisibility({
    super.key,
    required this.child,
    this.visibleOn = const {
      DeviceType.mobile,
      DeviceType.tablet,
      DeviceType.desktop,
      DeviceType.watch,
    },
    this.replacementBuilder,
  });

  /// Creates a responsive visibility widget that shows the child only on mobile devices.
  const ResponsiveVisibility.mobile({
    super.key,
    required this.child,
    this.replacementBuilder,
  }) : visibleOn = const {DeviceType.mobile};

  /// Creates a responsive visibility widget that shows the child only on tablet devices.
  const ResponsiveVisibility.tablet({
    super.key,
    required this.child,
    this.replacementBuilder,
  }) : visibleOn = const {DeviceType.tablet};

  /// Creates a responsive visibility widget that shows the child only on desktop devices.
  const ResponsiveVisibility.desktop({
    super.key,
    required this.child,
    this.replacementBuilder,
  }) : visibleOn = const {DeviceType.desktop};

  /// Creates a responsive visibility widget that shows the child only on watch devices.
  const ResponsiveVisibility.watch({
    super.key,
    required this.child,
    this.replacementBuilder,
  }) : visibleOn = const {DeviceType.watch};

  /// The child widget to show when visible.
  final Widget child;

  /// The set of device types on which the child should be visible.
  final Set<DeviceType> visibleOn;

  /// The widget to show when the child is not visible.
  /// If null, an empty [SizedBox] will be shown.
  final WidgetBuilder? replacementBuilder;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveKit.of(context);

    if (visibleOn.contains(responsive.deviceType)) {
      return child;
    }

    return replacementBuilder?.call(context) ?? const SizedBox.shrink();
  }
}
