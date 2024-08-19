enum AppRoutes {
  onboarding(name: 'onboarding', path: '/onboarding'),
  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register'),
  home(name: 'home', path: '/home');

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
