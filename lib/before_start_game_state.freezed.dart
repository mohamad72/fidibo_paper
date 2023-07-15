// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'before_start_game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeforeStartGameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notReadyToStart,
    required TResult Function(List<Square> squares) readyToStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notReadyToStart,
    TResult? Function(List<Square> squares)? readyToStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notReadyToStart,
    TResult Function(List<Square> squares)? readyToStart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotReadyToStart value) notReadyToStart,
    required TResult Function(ReadyToStart value) readyToStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotReadyToStart value)? notReadyToStart,
    TResult? Function(ReadyToStart value)? readyToStart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotReadyToStart value)? notReadyToStart,
    TResult Function(ReadyToStart value)? readyToStart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeforeStartGameStateCopyWith<$Res> {
  factory $BeforeStartGameStateCopyWith(BeforeStartGameState value,
          $Res Function(BeforeStartGameState) then) =
      _$BeforeStartGameStateCopyWithImpl<$Res, BeforeStartGameState>;
}

/// @nodoc
class _$BeforeStartGameStateCopyWithImpl<$Res,
        $Val extends BeforeStartGameState>
    implements $BeforeStartGameStateCopyWith<$Res> {
  _$BeforeStartGameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NotReadyToStartCopyWith<$Res> {
  factory _$$NotReadyToStartCopyWith(
          _$NotReadyToStart value, $Res Function(_$NotReadyToStart) then) =
      __$$NotReadyToStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotReadyToStartCopyWithImpl<$Res>
    extends _$BeforeStartGameStateCopyWithImpl<$Res, _$NotReadyToStart>
    implements _$$NotReadyToStartCopyWith<$Res> {
  __$$NotReadyToStartCopyWithImpl(
      _$NotReadyToStart _value, $Res Function(_$NotReadyToStart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NotReadyToStart implements NotReadyToStart {
  const _$NotReadyToStart();

  @override
  String toString() {
    return 'BeforeStartGameState.notReadyToStart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotReadyToStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notReadyToStart,
    required TResult Function(List<Square> squares) readyToStart,
  }) {
    return notReadyToStart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notReadyToStart,
    TResult? Function(List<Square> squares)? readyToStart,
  }) {
    return notReadyToStart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notReadyToStart,
    TResult Function(List<Square> squares)? readyToStart,
    required TResult orElse(),
  }) {
    if (notReadyToStart != null) {
      return notReadyToStart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotReadyToStart value) notReadyToStart,
    required TResult Function(ReadyToStart value) readyToStart,
  }) {
    return notReadyToStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotReadyToStart value)? notReadyToStart,
    TResult? Function(ReadyToStart value)? readyToStart,
  }) {
    return notReadyToStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotReadyToStart value)? notReadyToStart,
    TResult Function(ReadyToStart value)? readyToStart,
    required TResult orElse(),
  }) {
    if (notReadyToStart != null) {
      return notReadyToStart(this);
    }
    return orElse();
  }
}

abstract class NotReadyToStart implements BeforeStartGameState {
  const factory NotReadyToStart() = _$NotReadyToStart;
}

/// @nodoc
abstract class _$$ReadyToStartCopyWith<$Res> {
  factory _$$ReadyToStartCopyWith(
          _$ReadyToStart value, $Res Function(_$ReadyToStart) then) =
      __$$ReadyToStartCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Square> squares});
}

/// @nodoc
class __$$ReadyToStartCopyWithImpl<$Res>
    extends _$BeforeStartGameStateCopyWithImpl<$Res, _$ReadyToStart>
    implements _$$ReadyToStartCopyWith<$Res> {
  __$$ReadyToStartCopyWithImpl(
      _$ReadyToStart _value, $Res Function(_$ReadyToStart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? squares = null,
  }) {
    return _then(_$ReadyToStart(
      squares: null == squares
          ? _value._squares
          : squares // ignore: cast_nullable_to_non_nullable
              as List<Square>,
    ));
  }
}

/// @nodoc

class _$ReadyToStart implements ReadyToStart {
  const _$ReadyToStart({required final List<Square> squares})
      : _squares = squares;

  final List<Square> _squares;
  @override
  List<Square> get squares {
    if (_squares is EqualUnmodifiableListView) return _squares;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_squares);
  }

  @override
  String toString() {
    return 'BeforeStartGameState.readyToStart(squares: $squares)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadyToStart &&
            const DeepCollectionEquality().equals(other._squares, _squares));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_squares));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadyToStartCopyWith<_$ReadyToStart> get copyWith =>
      __$$ReadyToStartCopyWithImpl<_$ReadyToStart>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notReadyToStart,
    required TResult Function(List<Square> squares) readyToStart,
  }) {
    return readyToStart(squares);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notReadyToStart,
    TResult? Function(List<Square> squares)? readyToStart,
  }) {
    return readyToStart?.call(squares);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notReadyToStart,
    TResult Function(List<Square> squares)? readyToStart,
    required TResult orElse(),
  }) {
    if (readyToStart != null) {
      return readyToStart(squares);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotReadyToStart value) notReadyToStart,
    required TResult Function(ReadyToStart value) readyToStart,
  }) {
    return readyToStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NotReadyToStart value)? notReadyToStart,
    TResult? Function(ReadyToStart value)? readyToStart,
  }) {
    return readyToStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotReadyToStart value)? notReadyToStart,
    TResult Function(ReadyToStart value)? readyToStart,
    required TResult orElse(),
  }) {
    if (readyToStart != null) {
      return readyToStart(this);
    }
    return orElse();
  }
}

abstract class ReadyToStart implements BeforeStartGameState {
  const factory ReadyToStart({required final List<Square> squares}) =
      _$ReadyToStart;

  List<Square> get squares;
  @JsonKey(ignore: true)
  _$$ReadyToStartCopyWith<_$ReadyToStart> get copyWith =>
      throw _privateConstructorUsedError;
}
