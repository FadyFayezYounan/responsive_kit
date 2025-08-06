import 'dart:ui' show Size;

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

import 'responsive_breakpoints.dart';

/// Enum representing different device types.
enum DeviceType {
  /// Mobile phones (typically < 600px width)
  mobile,

  /// Tablet devices (typically 600px - 1024px width)
  tablet,

  /// Desktop devices (typically > 1024px width)
  desktop,

  /// Watch devices (typically < 300px width and square aspect ratio)
  watch;

  factory DeviceType._fromSize(Size size, ResponsiveBreakpoints breakpoints) {
    final width = size.width;
    final height = size.height;

    // Check for watch first (smallest screens with specific constraints)
    if (_isWatch(width, height, breakpoints)) {
      return DeviceType.watch;
    }

    // Check for mobile
    if (width <= breakpoints.mobileMaxWidth) {
      return DeviceType.mobile;
    }

    // Check for tablet
    if (width <= breakpoints.tabletMaxWidth) {
      return DeviceType.tablet;
    }

    // Default to desktop for larger screens
    return DeviceType.desktop;
  }

  static bool _isWatch(
    double width,
    double height,
    ResponsiveBreakpoints breakpoints,
  ) {
    // Watch detection: small screen with roughly square aspect ratio
    if (width <= breakpoints.watchMaxWidth &&
        height <= breakpoints.watchMaxHeight) {
      final aspectRatio = width / height;
      // Consider it a watch if aspect ratio is between 0.7 and 1.4 (roughly square)
      return aspectRatio >= 0.7 && aspectRatio <= 1.4;
    }
    return false;
  }

  factory DeviceType.detectWithPlatform({
    required Size size,
    required ResponsiveBreakpoints breakpoints,
  }) {
    final baseDetection = DeviceType._fromSize(size, breakpoints);
    if (!kIsWeb) {
      try {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android ||
              TargetPlatform.iOS ||
              TargetPlatform.fuchsia:
            // For mobile platforms, prefer mobile/tablet detection over desktop
            if (baseDetection == DeviceType.desktop && size.width < 1200) {
              return DeviceType.tablet;
            }
            break;

          case TargetPlatform.linux ||
              TargetPlatform.macOS ||
              TargetPlatform.windows:
            // On desktop platforms, prefer desktop detection for larger screens
            if (baseDetection == DeviceType.tablet && size.width > 800) {
              return DeviceType.desktop;
            }
            break;
        }
      } catch (e) {
        // Fallback to base detection if platform detection fails
        return baseDetection;
      }
    }

    return baseDetection;
  }

  bool get isMobile => this == DeviceType.mobile;
  bool get isTablet => this == DeviceType.tablet;
  bool get isDesktop => this == DeviceType.desktop;
  bool get isWatch => this == DeviceType.watch;
}
