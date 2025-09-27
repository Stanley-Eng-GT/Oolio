// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segmented_control_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SegmentedControlItem {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  /// Create a copy of SegmentedControlItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SegmentedControlItemCopyWith<SegmentedControlItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentedControlItemCopyWith<$Res> {
  factory $SegmentedControlItemCopyWith(SegmentedControlItem value,
          $Res Function(SegmentedControlItem) then) =
      _$SegmentedControlItemCopyWithImpl<$Res, SegmentedControlItem>;
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class _$SegmentedControlItemCopyWithImpl<$Res,
        $Val extends SegmentedControlItem>
    implements $SegmentedControlItemCopyWith<$Res> {
  _$SegmentedControlItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SegmentedControlItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SegmentedControlItemImplCopyWith<$Res>
    implements $SegmentedControlItemCopyWith<$Res> {
  factory _$$SegmentedControlItemImplCopyWith(_$SegmentedControlItemImpl value,
          $Res Function(_$SegmentedControlItemImpl) then) =
      __$$SegmentedControlItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value});
}

/// @nodoc
class __$$SegmentedControlItemImplCopyWithImpl<$Res>
    extends _$SegmentedControlItemCopyWithImpl<$Res, _$SegmentedControlItemImpl>
    implements _$$SegmentedControlItemImplCopyWith<$Res> {
  __$$SegmentedControlItemImplCopyWithImpl(_$SegmentedControlItemImpl _value,
      $Res Function(_$SegmentedControlItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SegmentedControlItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
  }) {
    return _then(_$SegmentedControlItemImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SegmentedControlItemImpl implements _SegmentedControlItem {
  const _$SegmentedControlItemImpl({required this.label, required this.value});

  @override
  final String label;
  @override
  final String value;

  @override
  String toString() {
    return 'SegmentedControlItem(label: $label, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SegmentedControlItemImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value);

  /// Create a copy of SegmentedControlItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SegmentedControlItemImplCopyWith<_$SegmentedControlItemImpl>
      get copyWith =>
          __$$SegmentedControlItemImplCopyWithImpl<_$SegmentedControlItemImpl>(
              this, _$identity);
}

abstract class _SegmentedControlItem implements SegmentedControlItem {
  const factory _SegmentedControlItem(
      {required final String label,
      required final String value}) = _$SegmentedControlItemImpl;

  @override
  String get label;
  @override
  String get value;

  /// Create a copy of SegmentedControlItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SegmentedControlItemImplCopyWith<_$SegmentedControlItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
