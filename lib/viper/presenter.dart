abstract class Presenter<R> {
  R get router;

  void init();
  void dispose();
}