enum FontSize {
  low(value: 10),
  lowMid(value: 12),
  medium(value: 16),
  midHigh(value: 20),
  high(value: 24),
  veryHigh(value: 26),
  ;

  final double value;

  const FontSize({required this.value});
}
