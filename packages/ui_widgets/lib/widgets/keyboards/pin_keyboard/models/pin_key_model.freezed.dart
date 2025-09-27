// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_key_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PinKeyModel _$PinKeyModelFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'digitOnly':
      return _DigitOnly.fromJson(json);
    case 'digitWithChars':
      return _DigitWithChars.fromJson(json);
    case 'placeholder':
      return _Placeholder.fromJson(json);
    case 'delete':
      return _Delete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'PinKeyModel',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$PinKeyModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) digitOnly,
    required TResult Function(String title, String subtitle) digitWithChars,
    required TResult Function() placeholder,
    required TResult Function() delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? digitOnly,
    TResult? Function(String title, String subtitle)? digitWithChars,
    TResult? Function()? placeholder,
    TResult? Function()? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? digitOnly,
    TResult Function(String title, String subtitle)? digitWithChars,
    TResult Function()? placeholder,
    TResult Function()? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitOnly value) digitOnly,
    required TResult Function(_DigitWithChars value) digitWithChars,
    required TResult Function(_Placeholder value) placeholder,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitOnly value)? digitOnly,
    TResult? Function(_DigitWithChars value)? digitWithChars,
    TResult? Function(_Placeholder value)? placeholder,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitOnly value)? digitOnly,
    TResult Function(_DigitWithChars value)? digitWithChars,
    TResult Function(_Placeholder value)? placeholder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this PinKeyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PinKeyModelCopyWith<$Res> {
  factory $PinKeyModelCopyWith(
          PinKeyModel value, $Res Function(PinKeyModel) then) =
      _$PinKeyModelCopyWithImpl<$Res, PinKeyModel>;
}

/// @nodoc
class _$PinKeyModelCopyWithImpl<$Res, $Val extends PinKeyModel>
    implements $PinKeyModelCopyWith<$Res> {
  _$PinKeyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DigitOnlyImplCopyWith<$Res> {
  factory _$$DigitOnlyImplCopyWith(
          _$DigitOnlyImpl value, $Res Function(_$DigitOnlyImpl) then) =
      __$$DigitOnlyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$DigitOnlyImplCopyWithImpl<$Res>
    extends _$PinKeyModelCopyWithImpl<$Res, _$DigitOnlyImpl>
    implements _$$DigitOnlyImplCopyWith<$Res> {
  __$$DigitOnlyImplCopyWithImpl(
      _$DigitOnlyImpl _value, $Res Function(_$DigitOnlyImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$DigitOnlyImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DigitOnlyImpl implements _DigitOnly {
  const _$DigitOnlyImpl({required this.title, final String? $type})
      : $type = $type ?? 'digitOnly';

  factory _$DigitOnlyImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitOnlyImplFromJson(json);

  @override
  final String title;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PinKeyModel.digitOnly(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitOnlyImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitOnlyImplCopyWith<_$DigitOnlyImpl> get copyWith =>
      __$$DigitOnlyImplCopyWithImpl<_$DigitOnlyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) digitOnly,
    required TResult Function(String title, String subtitle) digitWithChars,
    required TResult Function() placeholder,
    required TResult Function() delete,
  }) {
    return digitOnly(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? digitOnly,
    TResult? Function(String title, String subtitle)? digitWithChars,
    TResult? Function()? placeholder,
    TResult? Function()? delete,
  }) {
    return digitOnly?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? digitOnly,
    TResult Function(String title, String subtitle)? digitWithChars,
    TResult Function()? placeholder,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (digitOnly != null) {
      return digitOnly(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitOnly value) digitOnly,
    required TResult Function(_DigitWithChars value) digitWithChars,
    required TResult Function(_Placeholder value) placeholder,
    required TResult Function(_Delete value) delete,
  }) {
    return digitOnly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitOnly value)? digitOnly,
    TResult? Function(_DigitWithChars value)? digitWithChars,
    TResult? Function(_Placeholder value)? placeholder,
    TResult? Function(_Delete value)? delete,
  }) {
    return digitOnly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitOnly value)? digitOnly,
    TResult Function(_DigitWithChars value)? digitWithChars,
    TResult Function(_Placeholder value)? placeholder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (digitOnly != null) {
      return digitOnly(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitOnlyImplToJson(
      this,
    );
  }
}

abstract class _DigitOnly implements PinKeyModel {
  const factory _DigitOnly({required final String title}) = _$DigitOnlyImpl;

  factory _DigitOnly.fromJson(Map<String, dynamic> json) =
      _$DigitOnlyImpl.fromJson;

  String get title;

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DigitOnlyImplCopyWith<_$DigitOnlyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DigitWithCharsImplCopyWith<$Res> {
  factory _$$DigitWithCharsImplCopyWith(_$DigitWithCharsImpl value,
          $Res Function(_$DigitWithCharsImpl) then) =
      __$$DigitWithCharsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title, String subtitle});
}

/// @nodoc
class __$$DigitWithCharsImplCopyWithImpl<$Res>
    extends _$PinKeyModelCopyWithImpl<$Res, _$DigitWithCharsImpl>
    implements _$$DigitWithCharsImplCopyWith<$Res> {
  __$$DigitWithCharsImplCopyWithImpl(
      _$DigitWithCharsImpl _value, $Res Function(_$DigitWithCharsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? subtitle = null,
  }) {
    return _then(_$DigitWithCharsImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: null == subtitle
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DigitWithCharsImpl implements _DigitWithChars {
  const _$DigitWithCharsImpl(
      {required this.title, required this.subtitle, final String? $type})
      : $type = $type ?? 'digitWithChars';

  factory _$DigitWithCharsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitWithCharsImplFromJson(json);

  @override
  final String title;
  @override
  final String subtitle;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PinKeyModel.digitWithChars(title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitWithCharsImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subtitle, subtitle) ||
                other.subtitle == subtitle));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, subtitle);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitWithCharsImplCopyWith<_$DigitWithCharsImpl> get copyWith =>
      __$$DigitWithCharsImplCopyWithImpl<_$DigitWithCharsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) digitOnly,
    required TResult Function(String title, String subtitle) digitWithChars,
    required TResult Function() placeholder,
    required TResult Function() delete,
  }) {
    return digitWithChars(title, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? digitOnly,
    TResult? Function(String title, String subtitle)? digitWithChars,
    TResult? Function()? placeholder,
    TResult? Function()? delete,
  }) {
    return digitWithChars?.call(title, subtitle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? digitOnly,
    TResult Function(String title, String subtitle)? digitWithChars,
    TResult Function()? placeholder,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (digitWithChars != null) {
      return digitWithChars(title, subtitle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitOnly value) digitOnly,
    required TResult Function(_DigitWithChars value) digitWithChars,
    required TResult Function(_Placeholder value) placeholder,
    required TResult Function(_Delete value) delete,
  }) {
    return digitWithChars(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitOnly value)? digitOnly,
    TResult? Function(_DigitWithChars value)? digitWithChars,
    TResult? Function(_Placeholder value)? placeholder,
    TResult? Function(_Delete value)? delete,
  }) {
    return digitWithChars?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitOnly value)? digitOnly,
    TResult Function(_DigitWithChars value)? digitWithChars,
    TResult Function(_Placeholder value)? placeholder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (digitWithChars != null) {
      return digitWithChars(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitWithCharsImplToJson(
      this,
    );
  }
}

abstract class _DigitWithChars implements PinKeyModel {
  const factory _DigitWithChars(
      {required final String title,
      required final String subtitle}) = _$DigitWithCharsImpl;

  factory _DigitWithChars.fromJson(Map<String, dynamic> json) =
      _$DigitWithCharsImpl.fromJson;

  String get title;
  String get subtitle;

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DigitWithCharsImplCopyWith<_$DigitWithCharsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaceholderImplCopyWith<$Res> {
  factory _$$PlaceholderImplCopyWith(
          _$PlaceholderImpl value, $Res Function(_$PlaceholderImpl) then) =
      __$$PlaceholderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlaceholderImplCopyWithImpl<$Res>
    extends _$PinKeyModelCopyWithImpl<$Res, _$PlaceholderImpl>
    implements _$$PlaceholderImplCopyWith<$Res> {
  __$$PlaceholderImplCopyWithImpl(
      _$PlaceholderImpl _value, $Res Function(_$PlaceholderImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PlaceholderImpl implements _Placeholder {
  const _$PlaceholderImpl({final String? $type})
      : $type = $type ?? 'placeholder';

  factory _$PlaceholderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceholderImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PinKeyModel.placeholder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlaceholderImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) digitOnly,
    required TResult Function(String title, String subtitle) digitWithChars,
    required TResult Function() placeholder,
    required TResult Function() delete,
  }) {
    return placeholder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? digitOnly,
    TResult? Function(String title, String subtitle)? digitWithChars,
    TResult? Function()? placeholder,
    TResult? Function()? delete,
  }) {
    return placeholder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? digitOnly,
    TResult Function(String title, String subtitle)? digitWithChars,
    TResult Function()? placeholder,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (placeholder != null) {
      return placeholder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitOnly value) digitOnly,
    required TResult Function(_DigitWithChars value) digitWithChars,
    required TResult Function(_Placeholder value) placeholder,
    required TResult Function(_Delete value) delete,
  }) {
    return placeholder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitOnly value)? digitOnly,
    TResult? Function(_DigitWithChars value)? digitWithChars,
    TResult? Function(_Placeholder value)? placeholder,
    TResult? Function(_Delete value)? delete,
  }) {
    return placeholder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitOnly value)? digitOnly,
    TResult Function(_DigitWithChars value)? digitWithChars,
    TResult Function(_Placeholder value)? placeholder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (placeholder != null) {
      return placeholder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceholderImplToJson(
      this,
    );
  }
}

abstract class _Placeholder implements PinKeyModel {
  const factory _Placeholder() = _$PlaceholderImpl;

  factory _Placeholder.fromJson(Map<String, dynamic> json) =
      _$PlaceholderImpl.fromJson;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$PinKeyModelCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PinKeyModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({final String? $type}) : $type = $type ?? 'delete';

  factory _$DeleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PinKeyModel.delete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String title) digitOnly,
    required TResult Function(String title, String subtitle) digitWithChars,
    required TResult Function() placeholder,
    required TResult Function() delete,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String title)? digitOnly,
    TResult? Function(String title, String subtitle)? digitWithChars,
    TResult? Function()? placeholder,
    TResult? Function()? delete,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String title)? digitOnly,
    TResult Function(String title, String subtitle)? digitWithChars,
    TResult Function()? placeholder,
    TResult Function()? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DigitOnly value) digitOnly,
    required TResult Function(_DigitWithChars value) digitWithChars,
    required TResult Function(_Placeholder value) placeholder,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DigitOnly value)? digitOnly,
    TResult? Function(_DigitWithChars value)? digitWithChars,
    TResult? Function(_Placeholder value)? placeholder,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DigitOnly value)? digitOnly,
    TResult Function(_DigitWithChars value)? digitWithChars,
    TResult Function(_Placeholder value)? placeholder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteImplToJson(
      this,
    );
  }
}

abstract class _Delete implements PinKeyModel {
  const factory _Delete() = _$DeleteImpl;

  factory _Delete.fromJson(Map<String, dynamic> json) = _$DeleteImpl.fromJson;
}
