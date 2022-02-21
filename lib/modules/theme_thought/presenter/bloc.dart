import 'package:coach/modules/home/domain/entities/thumb_entity.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BlocThemeThoght extends Disposable {
  ThumbEntity thumb() => Modular.args.data['thumb'];

  @override
  void dispose() {}
}
