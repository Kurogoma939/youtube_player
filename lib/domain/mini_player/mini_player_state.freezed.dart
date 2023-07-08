// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mini_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MiniPlayerState {
  MiniplayerController get controller => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MiniPlayerStateCopyWith<MiniPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniPlayerStateCopyWith<$Res> {
  factory $MiniPlayerStateCopyWith(
          MiniPlayerState value, $Res Function(MiniPlayerState) then) =
      _$MiniPlayerStateCopyWithImpl<$Res, MiniPlayerState>;
  @useResult
  $Res call({MiniplayerController controller});
}

/// @nodoc
class _$MiniPlayerStateCopyWithImpl<$Res, $Val extends MiniPlayerState>
    implements $MiniPlayerStateCopyWith<$Res> {
  _$MiniPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_value.copyWith(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as MiniplayerController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MiniPlayerStateCopyWith<$Res>
    implements $MiniPlayerStateCopyWith<$Res> {
  factory _$$_MiniPlayerStateCopyWith(
          _$_MiniPlayerState value, $Res Function(_$_MiniPlayerState) then) =
      __$$_MiniPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MiniplayerController controller});
}

/// @nodoc
class __$$_MiniPlayerStateCopyWithImpl<$Res>
    extends _$MiniPlayerStateCopyWithImpl<$Res, _$_MiniPlayerState>
    implements _$$_MiniPlayerStateCopyWith<$Res> {
  __$$_MiniPlayerStateCopyWithImpl(
      _$_MiniPlayerState _value, $Res Function(_$_MiniPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$_MiniPlayerState(
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as MiniplayerController,
    ));
  }
}

/// @nodoc

class _$_MiniPlayerState implements _MiniPlayerState {
  const _$_MiniPlayerState({required this.controller});

  @override
  final MiniplayerController controller;

  @override
  String toString() {
    return 'MiniPlayerState(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiniPlayerState &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiniPlayerStateCopyWith<_$_MiniPlayerState> get copyWith =>
      __$$_MiniPlayerStateCopyWithImpl<_$_MiniPlayerState>(this, _$identity);
}

abstract class _MiniPlayerState implements MiniPlayerState {
  const factory _MiniPlayerState(
      {required final MiniplayerController controller}) = _$_MiniPlayerState;

  @override
  MiniplayerController get controller;
  @override
  @JsonKey(ignore: true)
  _$$_MiniPlayerStateCopyWith<_$_MiniPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
