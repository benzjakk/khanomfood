import 'package:khanomfood/ui/pages/signin_page.dart';
import 'package:provider/provider.dart';
import 'package:khanomfood/models/user.dart';
import 'package:flutter/material.dart';
import 'package:khanomfood/ui/widgets/navigation_widget.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user != null) {
      return NavigationWidget();
    } else
      return SignInPage();
  }
}
