import 'package:flutter/foundation.dart'
    show Diagnosticable, DiagnosticPropertiesBuilder, DoubleProperty;

/// Configuration class that defines breakpoints for different device types.
class ResponsiveBreakpoints with Diagnosticable {
  /// Default constructor with predefined breakpoints.
  const ResponsiveBreakpoints({
    this.mobileMaxWidth = 600,
    this.tabletMaxWidth = 1024,
    this.watchMaxWidth = 300,
    this.watchMaxHeight = 400,
  });
  const ResponsiveBreakpoints.defaults()
    : mobileMaxWidth = 600,
      tabletMaxWidth = 1024,
      watchMaxWidth = 300,
      watchMaxHeight = 400;

  /// Maximum width for mobile devices (inclusive).
  final double mobileMaxWidth;

  /// Maximum width for tablet devices (inclusive).
  final double tabletMaxWidth;

  /// Maximum width for watch devices (inclusive).
  final double watchMaxWidth;

  /// Maximum height for watch devices (inclusive).
  final double watchMaxHeight;

  /// Creates a copy of this breakpoints configuration with optional overrides.
  ResponsiveBreakpoints copyWith({
    double? mobileMaxWidth,
    double? tabletMaxWidth,
    double? watchMaxWidth,
    double? watchMaxHeight,
  }) {
    return ResponsiveBreakpoints(
      mobileMaxWidth: mobileMaxWidth ?? this.mobileMaxWidth,
      tabletMaxWidth: tabletMaxWidth ?? this.tabletMaxWidth,
      watchMaxWidth: watchMaxWidth ?? this.watchMaxWidth,
      watchMaxHeight: watchMaxHeight ?? this.watchMaxHeight,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResponsiveBreakpoints &&
          runtimeType == other.runtimeType &&
          mobileMaxWidth == other.mobileMaxWidth &&
          tabletMaxWidth == other.tabletMaxWidth &&
          watchMaxWidth == other.watchMaxWidth &&
          watchMaxHeight == other.watchMaxHeight;

  @override
  int get hashCode => Object.hashAll([
    mobileMaxWidth,
    tabletMaxWidth,
    watchMaxWidth,
    watchMaxHeight,
  ]);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties.add(DoubleProperty('mobileMaxWidth', mobileMaxWidth));
    properties.add(DoubleProperty('tabletMaxWidth', tabletMaxWidth));
    properties.add(DoubleProperty('watchMaxWidth', watchMaxWidth));
    properties.add(DoubleProperty('watchMaxHeight', watchMaxHeight));
    super.debugFillProperties(properties);
  }
}
