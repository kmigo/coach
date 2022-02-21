// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller_create_thought.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateThoughtStore on _CreateThoughtStoreBase, Store {
  final _$thumbEntityAtom = Atom(name: '_CreateThoughtStoreBase.thumbEntity');

  @override
  ThumbEntity get thumbEntity {
    _$thumbEntityAtom.reportRead();
    return super.thumbEntity;
  }

  @override
  set thumbEntity(ThumbEntity value) {
    _$thumbEntityAtom.reportWrite(value, super.thumbEntity, () {
      super.thumbEntity = value;
    });
  }

  final _$_CreateThoughtStoreBaseActionController =
      ActionController(name: '_CreateThoughtStoreBase');

  @override
  void _setThumbEntity(ThumbEntity _thumbEntity) {
    final _$actionInfo = _$_CreateThoughtStoreBaseActionController.startAction(
        name: '_CreateThoughtStoreBase._setThumbEntity');
    try {
      return super._setThumbEntity(_thumbEntity);
    } finally {
      _$_CreateThoughtStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
thumbEntity: ${thumbEntity}
    ''';
  }
}
