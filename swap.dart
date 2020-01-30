main(List<String> args) {
  int a = 1, b = 2;
  print('a = $a\nb = $b');
  a = a + b;
  b = a - b;
  a = a -b;
  print('a = $a\nb = $b');
}