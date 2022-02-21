import '../commons/theme_manager.dart';

import '../modules/home/presenter/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'theme_thought/presenter/bloc.dart';
import 'transition_thought/presenter/thought_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => ThemeManager()),
        Bind.lazySingleton((i) => BlocThemeThoght())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (ctx, args) => const HomePage()),
        ChildRoute('/transition_thought',
            child: (ctx, args) => const ThoughtPage(),
            transition: TransitionType.custom,
            customTransition: CustomTransition(
              transitionDuration: const Duration(milliseconds: 800),
              transitionBuilder: (ctx, anim, anim2, child) => child,
            ))
      ];
}
