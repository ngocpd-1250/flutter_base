enum AppRoutes {
  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register');

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
