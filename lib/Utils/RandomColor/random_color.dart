import 'dart:math';
import 'dart:ui';

class RandomHexColor {
  static const Color one = Color(0xffCFFFE6);
  static const Color two = Color(0xffFFF5ED);
  static const Color three = Color(0xffE9F8FF);
  static const Color four = Color(0xffF5ECFF);
  static const Color five = Color(0xffE6FFFB);

  List<Color> hexColor = [one, two, three,four,five];

  static final _random = Random();

  Color colorRandom() {
    return hexColor[_random.nextInt(3)];
  }
}