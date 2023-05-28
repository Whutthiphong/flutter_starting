import 'package:json_annotation/json_annotation.dart';
part 'get-model-v1.g.dart';

@JsonSerializable()
class GetModelV1 {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  GetModelV1(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);

  factory GetModelV1.fromJson(json) => _$GetModelV1FromJson(json);
  Map<String, dynamic> toJson() => _$GetModelV1ToJson(this);
}
