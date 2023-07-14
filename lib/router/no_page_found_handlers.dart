import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/providers/side_menu_provider.dart';
import 'package:flutter_admin_dashboard/ui/views/no_page_found_view.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, parameters) {
    Provider.of<SideMenuProvider>(context!).setCurrentPageUrl('/Error404');
    return const NoPageFoundView();
  });
}
