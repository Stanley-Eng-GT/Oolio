// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'toggle_selection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ToggleSelectionModel<T> {
  T get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Create a copy of ToggleSelectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ToggleSelectionModelCopyWith<T, ToggleSelectionModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToggleSelectionModelCopyWith<T, $Res> {
  factory $ToggleSelectionModelCopyWith(ToggleSelectionModel<T> value,
          $Res Function(ToggleSelectionModel<T>) then) =
      _$ToggleSelectionModelCopyWithImpl<T, $Res, ToggleSelectionModel<T>>;
  @useResult
  $Res call({T type, String label, bool isSelected});
}

/// @nodoc
class _$ToggleSelectionModelCopyWithImpl<T, $Res,
        $Val extends ToggleSelectionModel<T>>
    implements $ToggleSelectionModelCopyWith<T, $Res> {
  _$ToggleSelectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ToggleSelectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? label = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as T,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToggleSelectionModelImplCopyWith<T, $Res>
    implements $ToggleSelectionModelCopyWith<T, $Res> {
  factory _$$ToggleSelectionModelImplCopyWith(
          _$ToggleSelectionModelImpl<T> value,
          $Res Function(_$ToggleSelectionModelImpl<T>) then) =
      __$$ToggleSelectionModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T type, String label, bool isSelected});
}

/// @nodoc
class __$$ToggleSelectionModelImplCopyWithImpl<T, $Res>
    extends _$ToggleSelectionModelCopyWithImpl<T, $Res,
        _$ToggleSelectionModelImpl<T>>
    implements _$$ToggleSelectionModelImplCopyWith<T, $Res> {
  __$$ToggleSelectionModelImplCopyWithImpl(_$ToggleSelectionModelImpl<T> _value,
      $Res Function(_$ToggleSelectionModelImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ToggleSelectionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? label = null,
    Object? isSelected = null,
  }) {
    return _then(_$ToggleSelectionModelImpl<T>(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as T,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleSelectionModelImpl<T> implements _ToggleSelectionModel<T> {
  const _$ToggleSelectionModelImpl(
      {required this.type, required this.label, this.isSelected = false});

  @override
  final T type;
  @override
  final String label;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'ToggleSelectionModel<$T>(type: $type, label: $label, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSelectionModelImpl<T> &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(type), label, isSelected);

  /// Create a copy of ToggleSelectionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSelectionModelImplCopyWith<T, _$ToggleSelectionModelImpl<T>>
      get copyWith => __$$ToggleSelectionModelImplCopyWithImpl<T,
          _$ToggleSelectionModelImpl<T>>(this, _$identity);
}

abstract class _ToggleSelectionModel<T> implements ToggleSelectionModel<T> {
  const factory _ToggleSelectionModel(
      {required final T type,
      required final String label,
      final bool isSelected}) = _$ToggleSelectionModelImpl<T>;

  @override
  T get type;
  @override
  String get label;
  @override
  bool get isSelected;

  /// Create a copy of ToggleSelectionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleSelectionModelImplCopyWith<T, _$ToggleSelectionModelImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
