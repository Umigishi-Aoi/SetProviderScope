import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'change_notifier_provider_counter_page.dart';
import 'home.dart';
import 'state_provider_counter_page.dart';

enum PageState{
  home,
  stateProvider,
  changeNotifierProvider,
}


final pageStateProvider = StateProvider((ref)=>PageState.home);

class PagesNavigator extends ConsumerWidget {
  const PagesNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Navigator(
      pages: [
        const MaterialPage(child: Home()),
        if(ref.watch(pageStateProvider) == PageState.stateProvider)
          const MaterialPage(child: StateProviderCounterPage()),
        if(ref.watch(pageStateProvider) == PageState.changeNotifierProvider)
          const MaterialPage(child: ChangeNotifierProviderCounterPage()),
      ],
      onPopPage: (route,result){
        ref.read(pageStateProvider.state).state = PageState.home;
        return false;
      },
    );
  }
}
