import '../../../../../modules/home/data/dto/thumb_dto.dart';
import 'package:coach/modules/home/domain/entities/thumb_entity.dart';
import 'package:coach/modules/home/pages/create_thought/presenter/presenter_create_thought.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'controller_create_thought.g.dart';

class CreateThoughtStore = _CreateThoughtStoreBase with _$CreateThoughtStore;

abstract class _CreateThoughtStoreBase with Store {
  final PresenterCreateThought _presenter;

  _CreateThoughtStoreBase(this._presenter) {
    _init();
  }
  @observable
  ThumbEntity thumbEntity = ThumbDTO.fromMap({});

  @action
  void _setThumbEntity(ThumbEntity _thumbEntity) => thumbEntity = _thumbEntity;

  handlerThumbEntity(ThumbEntity thumbEntity) => _setThumbEntity(thumbEntity);

  _init() {
    if (_containArgs()) _setThumbEntity(Modular.args.data['thumb']);
  }

  bool _containArgs() {
    return Modular.args.data != null;
  }
}
