import 'package:flutter/material.dart';

class ScreenFormatHelper {

    static bool isNarrow(BoxConstraints constraints) {
        return constraints.maxWidth < 500;
    }

    static bool isNarrowWithThreshold(BoxConstraints constraints, double threshold) {
        return constraints.maxWidth < threshold;
    }

}