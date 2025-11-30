import 'toCurrency.dart';

String enMillon(num mes) {
  return toCurrency$('${(mes / 1000000).toStringAsFixed(0)}');
}
