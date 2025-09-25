extension Let<T> on T? {
  void let(Function(T) op) {
    final value = this;
    if (value != null) {
      op(value);
    }
  }
}
