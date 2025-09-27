// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImageModelImpl _$$ProductImageModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductImageModelImpl(
      thumbnail: json['thumbnail'] as String,
      mobile: json['mobile'] as String,
      tablet: json['tablet'] as String,
      desktop: json['desktop'] as String,
    );

Map<String, dynamic> _$$ProductImageModelImplToJson(
        _$ProductImageModelImpl instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'mobile': instance.mobile,
      'tablet': instance.tablet,
      'desktop': instance.desktop,
    };
