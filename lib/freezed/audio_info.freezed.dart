// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioInfo {
  int? get total;
  List<AudioItem>? get data;

  /// Create a copy of AudioInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AudioInfoCopyWith<AudioInfo> get copyWith =>
      _$AudioInfoCopyWithImpl<AudioInfo>(this as AudioInfo, _$identity);

  /// Serializes this AudioInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AudioInfo &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'AudioInfo(total: $total, data: $data)';
  }
}

/// @nodoc
abstract mixin class $AudioInfoCopyWith<$Res> {
  factory $AudioInfoCopyWith(AudioInfo value, $Res Function(AudioInfo) _then) =
      _$AudioInfoCopyWithImpl;
  @useResult
  $Res call({int? total, List<AudioItem>? data});
}

/// @nodoc
class _$AudioInfoCopyWithImpl<$Res> implements $AudioInfoCopyWith<$Res> {
  _$AudioInfoCopyWithImpl(this._self, this._then);

  final AudioInfo _self;
  final $Res Function(AudioInfo) _then;

  /// Create a copy of AudioInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AudioItem>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AudioInfo].
extension AudioInfoPatterns on AudioInfo {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AudioInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioInfo() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AudioInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioInfo():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AudioInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioInfo() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int? total, List<AudioItem>? data)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioInfo() when $default != null:
        return $default(_that.total, _that.data);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int? total, List<AudioItem>? data) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioInfo():
        return $default(_that.total, _that.data);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int? total, List<AudioItem>? data)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioInfo() when $default != null:
        return $default(_that.total, _that.data);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AudioInfo implements AudioInfo {
  const _AudioInfo({this.total, final List<AudioItem>? data}) : _data = data;
  factory _AudioInfo.fromJson(Map<String, dynamic> json) =>
      _$AudioInfoFromJson(json);

  @override
  final int? total;
  final List<AudioItem>? _data;
  @override
  List<AudioItem>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of AudioInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AudioInfoCopyWith<_AudioInfo> get copyWith =>
      __$AudioInfoCopyWithImpl<_AudioInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AudioInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AudioInfo &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'AudioInfo(total: $total, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$AudioInfoCopyWith<$Res>
    implements $AudioInfoCopyWith<$Res> {
  factory _$AudioInfoCopyWith(
          _AudioInfo value, $Res Function(_AudioInfo) _then) =
      __$AudioInfoCopyWithImpl;
  @override
  @useResult
  $Res call({int? total, List<AudioItem>? data});
}

/// @nodoc
class __$AudioInfoCopyWithImpl<$Res> implements _$AudioInfoCopyWith<$Res> {
  __$AudioInfoCopyWithImpl(this._self, this._then);

  final _AudioInfo _self;
  final $Res Function(_AudioInfo) _then;

  /// Create a copy of AudioInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = freezed,
    Object? data = freezed,
  }) {
    return _then(_AudioInfo(
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AudioItem>?,
    ));
  }
}

// dart format on
