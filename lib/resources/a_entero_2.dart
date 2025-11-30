int aEntero(String dato) {
  if (dato.isEmpty) return 0;
  if (dato == '-') return 0;
  return int.parse(dato);
}

int aEnteroNoCero(String dato) {
  if (dato.isEmpty) return 1;
  return int.parse(dato);
}

num aNum(String dato) {
  if (dato.isEmpty) return 0;
  if (dato == '-') return 0;
  return num.parse(dato);
}
