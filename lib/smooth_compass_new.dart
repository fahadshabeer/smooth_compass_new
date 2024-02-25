library smooth_compass_new;

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter_sensors/flutter_sensors.dart';
import 'package:smooth_compass_new/utils/src/compass_ui.dart';
import 'package:smooth_compass_new/utils/src/qibla_utils.dart';
import 'package:vector_math/vector_math.dart';

part 'utils/src/compass.dart';

class Compass {
  /// Singleton instance.
  static final Compass _instance = Compass._internal();

  /// Class factory. Init the instance if was not initialized before.
  factory Compass() {
    return _instance;
  }

  /// Internal private constructor for the singleton.
  Compass._internal();

  /// Plugin instance.
  final _Compass _compass = _Compass();

  ///Returns a stream to receive the compass updates.
  ///
  ///Remember to close the stream after using it.
  Stream<CompassModel> compassUpdates(
          {Duration? interval, double? azimuthFix, MyLoc? currentLoc}) =>
      _compass.compassUpdates(interval!, azimuthFix!, myLoc: currentLoc);

  /// Checks if the sensors needed for the compass to work are available.
  ///
  /// Returns true if the sensors are available or false otherwise.
  Future<bool> isCompassAvailable() => _Compass.isCompassAvailable;

  void setAzimuthFix(double fix) => _compass.azimuthFix = fix;
}
