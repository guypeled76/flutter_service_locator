import 'package:flutter/material.dart';
import 'package:service_locator/service_locator.dart';

class ServiceScope extends InheritedWidget {


  final ServiceProvider provider;

  ServiceScope({Key key,
    @required this.provider,
    @required Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }

  static ServiceType get<ServiceType>(BuildContext context) {
    ServiceScope provider = context.inheritFromWidgetOfExactType(ServiceScope);
    if(provider != null) {
      return provider._get<ServiceType>();
    }
    return null;
  }

  ServiceType _get<ServiceType>() {
    return this.provider.get<ServiceType>();
  }

}
