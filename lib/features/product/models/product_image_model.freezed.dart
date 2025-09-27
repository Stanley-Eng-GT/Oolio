// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) {
  return _ProductImageModel.fromJson(json);
}

/// @nodoc
mixin _$ProductImageModel {
  String get thumbnail => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get tablet => throw _privateConstructorUsedError;
  String get desktop => throw _privateConstructorUsedError;

  /// Serializes this ProductImageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductImageModelCopyWith<ProductImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImageModelCopyWith<$Res> {
  factory $ProductImageModelCopyWith(
          ProductImageModel value, $Res Function(ProductImageModel) then) =
      _$ProductImageModelCopyWithImpl<$Res, ProductImageModel>;
  @useResult
  $Res call({String thumbnail, String mobile, String tablet, String desktop});
}

/// @nodoc
class _$ProductImageModelCopyWithImpl<$Res, $Val extends ProductImageModel>
    implements $ProductImageModelCopyWith<$Res> {
  _$ProductImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? mobile = null,
    Object? tablet = null,
    Object? desktop = null,
  }) {
    return _then(_value.copyWith(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      tablet: null == tablet
          ? _value.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as String,
      desktop: null == desktop
          ? _value.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImageModelImplCopyWith<$Res>
    implements $ProductImageModelCopyWith<$Res> {
  factory _$$ProductImageModelImplCopyWith(_$ProductImageModelImpl value,
          $Res Function(_$ProductImageModelImpl) then) =
      __$$ProductImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String thumbnail, String mobile, String tablet, String desktop});
}

/// @nodoc
class __$$ProductImageModelImplCopyWithImpl<$Res>
    extends _$ProductImageModelCopyWithImpl<$Res, _$ProductImageModelImpl>
    implements _$$ProductImageModelImplCopyWith<$Res> {
  __$$ProductImageModelImplCopyWithImpl(_$ProductImageModelImpl _value,
      $Res Function(_$ProductImageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? thumbnail = null,
    Object? mobile = null,
    Object? tablet = null,
    Object? desktop = null,
  }) {
    return _then(_$ProductImageModelImpl(
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      tablet: null == tablet
          ? _value.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as String,
      desktop: null == desktop
          ? _value.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImageModelImpl implements _ProductImageModel {
  const _$ProductImageModelImpl(
      {required this.thumbnail,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  factory _$ProductImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImageModelImplFromJson(json);

  @override
  final String thumbnail;
  @override
  final String mobile;
  @override
  final String tablet;
  @override
  final String desktop;

  @override
  String toString() {
    return 'ProductImageModel(thumbnail: $thumbnail, mobile: $mobile, tablet: $tablet, desktop: $desktop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImageModelImpl &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.tablet, tablet) || other.tablet == tablet) &&
            (identical(other.desktop, desktop) || other.desktop == desktop));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, thumbnail, mobile, tablet, desktop);

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImageModelImplCopyWith<_$ProductImageModelImpl> get copyWith =>
      __$$ProductImageModelImplCopyWithImpl<_$ProductImageModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImageModelImplToJson(
      this,
    );
  }
}

abstract class _ProductImageModel implements ProductImageModel {
  const factory _ProductImageModel(
      {required final String thumbnail,
      required final String mobile,
      required final String tablet,
      required final String desktop}) = _$ProductImageModelImpl;

  factory _ProductImageModel.fromJson(Map<String, dynamic> json) =
      _$ProductImageModelImpl.fromJson;

  @override
  String get thumbnail;
  @override
  String get mobile;
  @override
  String get tablet;
  @override
  String get desktop;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImageModelImplCopyWith<_$ProductImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
