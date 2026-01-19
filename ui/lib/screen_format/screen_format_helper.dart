import 'package:flutter/material.dart';

class ScreenFormatHelper {

    static bool isNarrow(BoxConstraints constraints) {
        return constraints.maxWidth < 400;
    }

}