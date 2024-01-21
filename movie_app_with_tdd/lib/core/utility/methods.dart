String formatNumber(int number) {
  if (number < 1000) {
    return number.toString();
  } else if (number < 1000000) {
    return '${(number / 1000).toStringAsFixed(1)}k';
  } else if (number < 1000000000) {
    return '${(number / 1000000).toStringAsFixed(1)}M';
  } else {
    return '${(number / 1000000000).toStringAsFixed(1)}B';
  }
}
