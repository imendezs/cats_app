import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/breed.dart';

class BreedModel extends Breed {
  const BreedModel({
    required super.id,
    required super.name,
    required super.origin,
    super.countryCode,
    super.countryCodes,
    required super.intelligence,
    required super.adaptability,
    required super.affectionLevel,
    required super.childFriendly,
    required super.dogFriendly,
    required super.energyLevel,
    required super.grooming,
    required super.healthIssues,
    required super.sheddingLevel,
    required super.socialNeeds,
    required super.strangerFriendly,
    required super.vocalisation,
    required super.description,
    required super.temperament,
    required super.lifeSpan,
    super.altNames,
    super.wikipediaUrl,
    super.cfaUrl,
    super.vetstreetUrl,
    super.vcahospitalsUrl,
    super.referenceImageId,
    super.imageUrl,
    super.indoor,
    super.lap,
    super.experimental,
    super.hairless,
    super.natural,
    super.rare,
    super.rex,
    super.suppressedTail,
    super.shortLegs,
    super.hypoallergenic,
    super.weightImperial,
    super.weightMetric,
  });

  factory BreedModel.fromJson(Map<String, dynamic> json) {
    final weight = json['weight'] as Map<String, dynamic>?;
    
    return BreedModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      origin: json['origin'] ?? 'Unknown',
      countryCode: json['country_code'],
      countryCodes: json['country_codes'],
      intelligence: json['intelligence'] ?? 0,
      adaptability: json['adaptability'] ?? 0,
      affectionLevel: json['affection_level'] ?? 0,
      childFriendly: json['child_friendly'] ?? 0,
      dogFriendly: json['dog_friendly'] ?? 0,
      energyLevel: json['energy_level'] ?? 0,
      grooming: json['grooming'] ?? 0,
      healthIssues: json['health_issues'] ?? 0,
      sheddingLevel: json['shedding_level'] ?? 0,
      socialNeeds: json['social_needs'] ?? 0,
      strangerFriendly: json['stranger_friendly'] ?? 0,
      vocalisation: json['vocalisation'] ?? 0,
      description: json['description'] ?? '',
      temperament: json['temperament'] ?? '',
      lifeSpan: json['life_span'] ?? '',
      altNames: json['alt_names'],
      wikipediaUrl: json['wikipedia_url'],
      cfaUrl: json['cfa_url'],
      vetstreetUrl: json['vetstreet_url'],
      vcahospitalsUrl: json['vcahospitals_url'],
      referenceImageId: json['reference_image_id'],
      imageUrl: _getImageUrl(json),
      indoor: json['indoor'],
      lap: json['lap'],
      experimental: json['experimental'],
      hairless: json['hairless'],
      natural: json['natural'],
      rare: json['rare'],
      rex: json['rex'],
      suppressedTail: json['suppressed_tail'],
      shortLegs: json['short_legs'],
      hypoallergenic: json['hypoallergenic'],
      weightImperial: weight?['imperial'],
      weightMetric: weight?['metric'],
    );
  }

  static String? _getImageUrl(Map<String, dynamic> json) {
    if (json['image'] != null && json['image']['url'] != null) {
      return json['image']['url'] as String;
    }
    final refId = json['reference_image_id'] as String?;
    if (refId != null && refId.isNotEmpty) {
      return '${ApiConstants.imageCdnUrl}/$refId.jpg';
    }
    return null;
  }
}
