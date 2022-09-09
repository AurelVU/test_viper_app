class CounterService {
  Future<int> getStartCount() async {
    return Future.delayed(const Duration(seconds: 2), () => 1);
  }
}
