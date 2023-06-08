enum IsCycle {
  no(value: 0),
  yes(value: 1);

  const IsCycle({
    required this.value,
  });

  final int value;
}

enum CycleBy {
  solar(value: 0),
  lunar(value: 1);

  const CycleBy({
    required this.value,
  });

  final int value;
}