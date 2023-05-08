import 'package:lunar/calendar/Lunar.dart';

final Map<String, String> constellationMap = {
  '白羊': '♈️',
  '金牛': '♉️',
  '双子': '♊️',
  '巨蟹': '♋️',
  '狮子': '♌️',
  '处女': '♍️',
  '天秤': '♎️',
  '天蝎': '♏️',
  '射手': '♐️',
  '摩羯': '♑️',
  '水瓶': '♒️',
  '双鱼': '♓️',
};

const zodiacMap = {
  '鼠': '🐭',
  '牛': '🐮',
  '虎': '🐯',
  '兔': '🐰',
  '龙': '🐲',
  '蛇': '🐍',
  '马': '🐴',
  '羊': '🐑',
  '猴': '🐵',
  '鸡': '🐔',
  '狗': '🐶',
  '猪': '🐷',
};

String getBirthdayHoroscope(Lunar lunar) {
  final birthdayHoroscope = lunar.getEightChar();
  return "${birthdayHoroscope.getYear()}年 ${birthdayHoroscope.getMonth()}月 ${birthdayHoroscope.getDay()}日 ${birthdayHoroscope.getTime()}时";
}
