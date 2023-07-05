import 'package:fluro/fluro.dart';
import 'package:flutter_admin_dashboard/ui/views/no_page_found_view.dart';

class NoPageFoundHandlers {
  static Handler noPageFound =
      Handler(handlerFunc: (context, parameters) => const NoPageFoundView());
}
