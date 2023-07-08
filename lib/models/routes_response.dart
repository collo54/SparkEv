import 'package:spark_ev/models/route_item.dart';

class RouteResponseModel {
  RouteResponseModel({
    required this.routeItems,
  });
  final List<RouteItemsModel> routeItems;

  factory RouteResponseModel.fromJson(Map<String, dynamic> data) {
    final routeItemsData = data['routes'] as List<dynamic>?;
    // if the routes are not missing
    final routes = routeItemsData != null
        // map each route to a RoutesItemmodel object
        ? routeItemsData
            .map((item) => RouteItemsModel.fromJson(item))
            // map() returns an Iterable so we convert it to a List
            .toList()
        // use an empty list as fallback value
        : <RouteItemsModel>[];

    // return result passing all the arguments
    return RouteResponseModel(
      routeItems: routes,
    );
  }
  /*
  Map<String, dynamic> toJson() {
    return {
      'routes': dprItems.map((item) => item.toMap()).toList(),
    };
  }
  */
}
