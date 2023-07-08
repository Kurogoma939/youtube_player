// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoState {
  Video? get selectedVideo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoStateCopyWith<VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoStateCopyWith<$Res> {
  factory $VideoStateCopyWith(
          VideoState value, $Res Function(VideoState) then) =
      _$VideoStateCopyWithImpl<$Res, VideoState>;
  @useResult
  $Res call({Video? selectedVideo});
}

/// @nodoc
class _$VideoStateCopyWithImpl<$Res, $Val extends VideoState>
    implements $VideoStateCopyWith<$Res> {
  _$VideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedVideo = freezed,
  }) {
    return _then(_value.copyWith(
      selectedVideo: freezed == selectedVideo
          ? _value.selectedVideo
          : selectedVideo // ignore: cast_nullable_to_non_nullable
              as Video?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoStateCopyWith<$Res>
    implements $VideoStateCopyWith<$Res> {
  factory _$$_VideoStateCopyWith(
          _$_VideoState value, $Res Function(_$_VideoState) then) =
      __$$_VideoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Video? selectedVideo});
}

/// @nodoc
class __$$_VideoStateCopyWithImpl<$Res>
    extends _$VideoStateCopyWithImpl<$Res, _$_VideoState>
    implements _$$_VideoStateCopyWith<$Res> {
  __$$_VideoStateCopyWithImpl(
      _$_VideoState _value, $Res Function(_$_VideoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedVideo = freezed,
  }) {
    return _then(_$_VideoState(
      selectedVideo: freezed == selectedVideo
          ? _value.selectedVideo
          : selectedVideo // ignore: cast_nullable_to_non_nullable
              as Video?,
    ));
  }
}

/// @nodoc

class _$_VideoState implements _VideoState {
  const _$_VideoState({required this.selectedVideo});

  @override
  final Video? selectedVideo;

  @override
  String toString() {
    return 'VideoState(selectedVideo: $selectedVideo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoState &&
            (identical(other.selectedVideo, selectedVideo) ||
                other.selectedVideo == selectedVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      __$$_VideoStateCopyWithImpl<_$_VideoState>(this, _$identity);
}

abstract class _VideoState implements VideoState {
  const factory _VideoState({required final Video? selectedVideo}) =
      _$_VideoState;

  @override
  Video? get selectedVideo;
  @override
  @JsonKey(ignore: true)
  _$$_VideoStateCopyWith<_$_VideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
