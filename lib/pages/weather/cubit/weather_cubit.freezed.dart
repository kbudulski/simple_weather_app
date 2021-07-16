// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'weather_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WeatherStateTearOff {
  const _$WeatherStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _WeatherLoading weatherLoading() {
    return const _WeatherLoading();
  }

  _WeatherLoaded weatherLoaded(Weather weather) {
    return _WeatherLoaded(
      weather,
    );
  }

  _WeatherLoadError weatherLoadError(String errorMsg) {
    return _WeatherLoadError(
      errorMsg,
    );
  }
}

/// @nodoc
const $WeatherState = _$WeatherStateTearOff();

/// @nodoc
mixin _$WeatherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() weatherLoading,
    required TResult Function(Weather weather) weatherLoaded,
    required TResult Function(String errorMsg) weatherLoadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? weatherLoading,
    TResult Function(Weather weather)? weatherLoaded,
    TResult Function(String errorMsg)? weatherLoadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_WeatherLoading value) weatherLoading,
    required TResult Function(_WeatherLoaded value) weatherLoaded,
    required TResult Function(_WeatherLoadError value) weatherLoadError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_WeatherLoading value)? weatherLoading,
    TResult Function(_WeatherLoaded value)? weatherLoaded,
    TResult Function(_WeatherLoadError value)? weatherLoadError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  final WeatherState _value;
  // ignore: unused_field
  final $Res Function(WeatherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$WeatherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'WeatherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() weatherLoading,
    required TResult Function(Weather weather) weatherLoaded,
    required TResult Function(String errorMsg) weatherLoadError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? weatherLoading,
    TResult Function(Weather weather)? weatherLoaded,
    TResult Function(String errorMsg)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_WeatherLoading value) weatherLoading,
    required TResult Function(_WeatherLoaded value) weatherLoaded,
    required TResult Function(_WeatherLoadError value) weatherLoadError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_WeatherLoading value)? weatherLoading,
    TResult Function(_WeatherLoaded value)? weatherLoaded,
    TResult Function(_WeatherLoadError value)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WeatherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$WeatherLoadingCopyWith<$Res> {
  factory _$WeatherLoadingCopyWith(
          _WeatherLoading value, $Res Function(_WeatherLoading) then) =
      __$WeatherLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$WeatherLoadingCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherLoadingCopyWith<$Res> {
  __$WeatherLoadingCopyWithImpl(
      _WeatherLoading _value, $Res Function(_WeatherLoading) _then)
      : super(_value, (v) => _then(v as _WeatherLoading));

  @override
  _WeatherLoading get _value => super._value as _WeatherLoading;
}

/// @nodoc

class _$_WeatherLoading implements _WeatherLoading {
  const _$_WeatherLoading();

  @override
  String toString() {
    return 'WeatherState.weatherLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WeatherLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() weatherLoading,
    required TResult Function(Weather weather) weatherLoaded,
    required TResult Function(String errorMsg) weatherLoadError,
  }) {
    return weatherLoading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? weatherLoading,
    TResult Function(Weather weather)? weatherLoaded,
    TResult Function(String errorMsg)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoading != null) {
      return weatherLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_WeatherLoading value) weatherLoading,
    required TResult Function(_WeatherLoaded value) weatherLoaded,
    required TResult Function(_WeatherLoadError value) weatherLoadError,
  }) {
    return weatherLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_WeatherLoading value)? weatherLoading,
    TResult Function(_WeatherLoaded value)? weatherLoaded,
    TResult Function(_WeatherLoadError value)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoading != null) {
      return weatherLoading(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoading implements WeatherState {
  const factory _WeatherLoading() = _$_WeatherLoading;
}

/// @nodoc
abstract class _$WeatherLoadedCopyWith<$Res> {
  factory _$WeatherLoadedCopyWith(
          _WeatherLoaded value, $Res Function(_WeatherLoaded) then) =
      __$WeatherLoadedCopyWithImpl<$Res>;
  $Res call({Weather weather});

  $WeatherCopyWith<$Res> get weather;
}

/// @nodoc
class __$WeatherLoadedCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherLoadedCopyWith<$Res> {
  __$WeatherLoadedCopyWithImpl(
      _WeatherLoaded _value, $Res Function(_WeatherLoaded) _then)
      : super(_value, (v) => _then(v as _WeatherLoaded));

  @override
  _WeatherLoaded get _value => super._value as _WeatherLoaded;

  @override
  $Res call({
    Object? weather = freezed,
  }) {
    return _then(_WeatherLoaded(
      weather == freezed
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Weather,
    ));
  }

  @override
  $WeatherCopyWith<$Res> get weather {
    return $WeatherCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value));
    });
  }
}

/// @nodoc

class _$_WeatherLoaded implements _WeatherLoaded {
  const _$_WeatherLoaded(this.weather);

  @override
  final Weather weather;

  @override
  String toString() {
    return 'WeatherState.weatherLoaded(weather: $weather)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherLoaded &&
            (identical(other.weather, weather) ||
                const DeepCollectionEquality().equals(other.weather, weather)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(weather);

  @JsonKey(ignore: true)
  @override
  _$WeatherLoadedCopyWith<_WeatherLoaded> get copyWith =>
      __$WeatherLoadedCopyWithImpl<_WeatherLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() weatherLoading,
    required TResult Function(Weather weather) weatherLoaded,
    required TResult Function(String errorMsg) weatherLoadError,
  }) {
    return weatherLoaded(weather);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? weatherLoading,
    TResult Function(Weather weather)? weatherLoaded,
    TResult Function(String errorMsg)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoaded != null) {
      return weatherLoaded(weather);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_WeatherLoading value) weatherLoading,
    required TResult Function(_WeatherLoaded value) weatherLoaded,
    required TResult Function(_WeatherLoadError value) weatherLoadError,
  }) {
    return weatherLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_WeatherLoading value)? weatherLoading,
    TResult Function(_WeatherLoaded value)? weatherLoaded,
    TResult Function(_WeatherLoadError value)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoaded != null) {
      return weatherLoaded(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoaded implements WeatherState {
  const factory _WeatherLoaded(Weather weather) = _$_WeatherLoaded;

  Weather get weather => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$WeatherLoadedCopyWith<_WeatherLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$WeatherLoadErrorCopyWith<$Res> {
  factory _$WeatherLoadErrorCopyWith(
          _WeatherLoadError value, $Res Function(_WeatherLoadError) then) =
      __$WeatherLoadErrorCopyWithImpl<$Res>;
  $Res call({String errorMsg});
}

/// @nodoc
class __$WeatherLoadErrorCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherLoadErrorCopyWith<$Res> {
  __$WeatherLoadErrorCopyWithImpl(
      _WeatherLoadError _value, $Res Function(_WeatherLoadError) _then)
      : super(_value, (v) => _then(v as _WeatherLoadError));

  @override
  _WeatherLoadError get _value => super._value as _WeatherLoadError;

  @override
  $Res call({
    Object? errorMsg = freezed,
  }) {
    return _then(_WeatherLoadError(
      errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WeatherLoadError implements _WeatherLoadError {
  const _$_WeatherLoadError(this.errorMsg);

  @override
  final String errorMsg;

  @override
  String toString() {
    return 'WeatherState.weatherLoadError(errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WeatherLoadError &&
            (identical(other.errorMsg, errorMsg) ||
                const DeepCollectionEquality()
                    .equals(other.errorMsg, errorMsg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(errorMsg);

  @JsonKey(ignore: true)
  @override
  _$WeatherLoadErrorCopyWith<_WeatherLoadError> get copyWith =>
      __$WeatherLoadErrorCopyWithImpl<_WeatherLoadError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() weatherLoading,
    required TResult Function(Weather weather) weatherLoaded,
    required TResult Function(String errorMsg) weatherLoadError,
  }) {
    return weatherLoadError(errorMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? weatherLoading,
    TResult Function(Weather weather)? weatherLoaded,
    TResult Function(String errorMsg)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoadError != null) {
      return weatherLoadError(errorMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_WeatherLoading value) weatherLoading,
    required TResult Function(_WeatherLoaded value) weatherLoaded,
    required TResult Function(_WeatherLoadError value) weatherLoadError,
  }) {
    return weatherLoadError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_WeatherLoading value)? weatherLoading,
    TResult Function(_WeatherLoaded value)? weatherLoaded,
    TResult Function(_WeatherLoadError value)? weatherLoadError,
    required TResult orElse(),
  }) {
    if (weatherLoadError != null) {
      return weatherLoadError(this);
    }
    return orElse();
  }
}

abstract class _WeatherLoadError implements WeatherState {
  const factory _WeatherLoadError(String errorMsg) = _$_WeatherLoadError;

  String get errorMsg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$WeatherLoadErrorCopyWith<_WeatherLoadError> get copyWith =>
      throw _privateConstructorUsedError;
}
