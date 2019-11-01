class SecondClassApplicator<S, T> {
  final T Function(S) builder;

  const SecondClassApplicator._(this.builder);

  T call(S w) => builder(w);

  T operator >>(S val) => builder(val);

  T apply(S val) => this >> val;
}