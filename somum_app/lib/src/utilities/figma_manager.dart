import 'package:somum_utilities/enums.dart';
import 'package:apollocode_flutter_utilities/apollocode_flutter_utilities.dart';
import 'package:flutter/material.dart';

class FigmaManager {
  static late FigmaManager _instance;
  static var _isInitialized = false;

  static FigmaManager get instance {
    if (_isInitialized) {
      return _instance;
    }
    throw StateError(
      'FigmaManager must be initialized before to get an instance.',
    );
  }

  static void initialize(BuildContext context) {
    if (!_isInitialized) {
      _instance = FigmaManager._(context);
      _isInitialized = true;
    }
  }

  late final BuildContext _context;

  FigmaManager._(BuildContext context) {
    _context = context;
    DimensionsHelper.initialize(
      context,
      FigmaFrameType.byDefault,
    );
  }

  DimensionsHelper get helper {
    return getHelperFor(
      FigmaFrameType.byDefault,
    );
  }

  DimensionsHelper getHelperFor(FigmaFrameType frameType) {
    return DimensionsHelper.getInstance(_context, frameType);
  }
}
