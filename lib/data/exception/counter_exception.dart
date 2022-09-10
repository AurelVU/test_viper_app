class CounterException implements Exception {
  CounterException({
    required this.message,
  });

  final String message;
}
