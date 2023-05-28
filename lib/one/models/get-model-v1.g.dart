// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get-model-v1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetModelV1 _$GetModelV1FromJson(Map<String, dynamic> json) => GetModelV1(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['price'] as int?,
      (json['discountPercentage'] as num?)?.toDouble(),
      (json['rating'] as num?)?.toDouble(),
      json['stock'] as int?,
      json['brand'] as String?,
      json['category'] as String?,
      json['thumbnail'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GetModelV1ToJson(GetModelV1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
