class Routes {
  static List<ThidleRoute> routes = [
    ThidleRoute(bottomTabIndex: 0, key: 'home'),
    ThidleRoute(bottomTabIndex: 1, key: 'swifts'),
    ThidleRoute(bottomTabIndex: 2, key: 'trending'),
    ThidleRoute(bottomTabIndex: 3, key: 'notifications'),
    ThidleRoute(key: 'profile'),
    ThidleRoute(key: 'settings'),
    ThidleRoute(key: 'search'),
  ];

  static getByIndex(int index){
    for(int c = 0; c < routes.length; c++){
      if(routes[c].bottomTabIndex == index) return routes[c];
    }
    return ThidleRoute(key: 'unknown');
  }

  static getByKey(String key){
    for(int c = 0; c < routes.length; c++){
      if(routes[c].key == key) return routes[c];
    }
    return ThidleRoute(key: 'unknown');
  }
}

class ThidleRoute {
  final int? bottomTabIndex;
  final String key;
  ThidleRoute({this.bottomTabIndex, required this.key});
}