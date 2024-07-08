import 'dart:math';

import 'package:dart_random_choice/dart_random_choice.dart';


String getRandomUnicode() {
  var uni = [ "\u2665", "\u00A5", "\u00AE",
    "\u00BB", "\u01EF", "\u1EFC",
    "\u1EFB", "\u02AC", "\u0277" ];
  return randomChoice(uni);
}

int random(int max, {int min = 1}) {
  return min + Random().nextInt(max - min);
}