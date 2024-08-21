enum AppRoutes {
  onboarding(name: 'onboarding', path: '/onboarding'),
  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register'),
  topMovie(name: 'top_movie', path: '/top_movie'),
  todo(name: 'todo', path: '/todo'),
  settings(name: 'settings', path: '/settings');

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
