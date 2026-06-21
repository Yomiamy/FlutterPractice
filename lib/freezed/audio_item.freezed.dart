// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioItem {
  int? get id;
  String? get title;
  String? get summary;
  String? get url;
  String? get fileExt;
  String? get modified;

  /// Create a copy of AudioItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AudioItemCopyWith<AudioItem> get copyWith =>
      _$AudioItemCopyWithImpl<AudioItem>(this as AudioItem, _$identity);

  /// Serializes this AudioItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AudioItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileExt, fileExt) || other.fileExt == fileExt) &&
            (identical(other.modified, modified) ||
                other.modified == modified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, summary, url, fileExt, modified);

  @override
  String toString() {
    return 'AudioItem(id: $id, title: $title, summary: $summary, url: $url, fileExt: $fileExt, modified: $modified)';
  }
}

/// @nodoc
abstract mixin class $AudioItemCopyWith<$Res> {
  factory $AudioItemCopyWith(AudioItem value, $Res Function(AudioItem) _then) =
      _$AudioItemCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? summary,
      String? url,
      String? fileExt,
      String? modified});
}

/// @nodoc
class _$AudioItemCopyWithImpl<$Res> implements $AudioItemCopyWith<$Res> {
  _$AudioItemCopyWithImpl(this._self, this._then);

  final AudioItem _self;
  final $Res Function(AudioItem) _then;

  /// Create a copy of AudioItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? url = freezed,
    Object? fileExt = freezed,
    Object? modified = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileExt: freezed == fileExt
          ? _self.fileExt
          : fileExt // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _self.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [AudioItem].
extension AudioItemPatterns on AudioItem {
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
    TResult Function(_AudioItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioItem() when $default != null:
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
    TResult Function(_AudioItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioItem():
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
    TResult? Function(_AudioItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioItem() when $default != null:
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
    TResult Function(int? id, String? title, String? summary, String? url,
            String? fileExt, String? modified)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AudioItem() when $default != null:
        return $default(_that.id, _that.title, _that.summary, _that.url,
            _that.fileExt, _that.modified);
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
    TResult Function(int? id, String? title, String? summary, String? url,
            String? fileExt, String? modified)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioItem():
        return $default(_that.id, _that.title, _that.summary, _that.url,
            _that.fileExt, _that.modified);
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
    TResult? Function(int? id, String? title, String? summary, String? url,
            String? fileExt, String? modified)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AudioItem() when $default != null:
        return $default(_that.id, _that.title, _that.summary, _that.url,
            _that.fileExt, _that.modified);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AudioItem implements AudioItem {
  const _AudioItem(
      {this.id,
      this.title,
      this.summary,
      this.url,
      this.fileExt,
      this.modified});
  factory _AudioItem.fromJson(Map<String, dynamic> json) =>
      _$AudioItemFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? summary;
  @override
  final String? url;
  @override
  final String? fileExt;
  @override
  final String? modified;

  /// Create a copy of AudioItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AudioItemCopyWith<_AudioItem> get copyWith =>
      __$AudioItemCopyWithImpl<_AudioItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AudioItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AudioItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.fileExt, fileExt) || other.fileExt == fileExt) &&
            (identical(other.modified, modified) ||
                other.modified == modified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, summary, url, fileExt, modified);

  @override
  String toString() {
    return 'AudioItem(id: $id, title: $title, summary: $summary, url: $url, fileExt: $fileExt, modified: $modified)';
  }
}

/// @nodoc
abstract mixin class _$AudioItemCopyWith<$Res>
    implements $AudioItemCopyWith<$Res> {
  factory _$AudioItemCopyWith(
          _AudioItem value, $Res Function(_AudioItem) _then) =
      __$AudioItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? summary,
      String? url,
      String? fileExt,
      String? modified});
}

/// @nodoc
class __$AudioItemCopyWithImpl<$Res> implements _$AudioItemCopyWith<$Res> {
  __$AudioItemCopyWithImpl(this._self, this._then);

  final _AudioItem _self;
  final $Res Function(_AudioItem) _then;

  /// Create a copy of AudioItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? summary = freezed,
    Object? url = freezed,
    Object? fileExt = freezed,
    Object? modified = freezed,
  }) {
    return _then(_AudioItem(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      summary: freezed == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      fileExt: freezed == fileExt
          ? _self.fileExt
          : fileExt // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _self.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
