import 'package:equatable/equatable.dart';

class Breed extends Equatable {
  final String id;
  final String name;
  final String origin;
  final String? countryCode;
  final String? countryCodes;
  final int intelligence;
  final int adaptability;
  final int affectionLevel;
  final int childFriendly;
  final int dogFriendly;
  final int energyLevel;
  final int grooming;
  final int healthIssues;
  final int sheddingLevel;
  final int socialNeeds;
  final int strangerFriendly;
  final int vocalisation;
  final String description;
  final String temperament;
  final String lifeSpan;
  final String? altNames;
  final String? wikipediaUrl;
  final String? cfaUrl;
  final String? vetstreetUrl;
  final String? vcahospitalsUrl;
  final String? referenceImageId;
  final String? imageUrl;
  final int? indoor;
  final int? lap;
  final int? experimental;
  final int? hairless;
  final int? natural;
  final int? rare;
  final int? rex;
  final int? suppressedTail;
  final int? shortLegs;
  final int? hypoallergenic;
  final String? weightImperial;
  final String? weightMetric;

  const Breed({
    required this.id,
    required this.name,
    required this.origin,
    this.countryCode,
    this.countryCodes,
    required this.intelligence,
    required this.adaptability,
    required this.affectionLevel,
    required this.childFriendly,
    required this.dogFriendly,
    required this.energyLevel,
    required this.grooming,
    required this.healthIssues,
    required this.sheddingLevel,
    required this.socialNeeds,
    required this.strangerFriendly,
    required this.vocalisation,
    required this.description,
    required this.temperament,
    required this.lifeSpan,
    this.altNames,
    this.wikipediaUrl,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.referenceImageId,
    this.imageUrl,
    this.indoor,
    this.lap,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.hypoallergenic,
    this.weightImperial,
    this.weightMetric,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        origin,
        countryCode,
        countryCodes,
        intelligence,
        adaptability,
        affectionLevel,
        childFriendly,
        dogFriendly,
        energyLevel,
        grooming,
        healthIssues,
        sheddingLevel,
        socialNeeds,
        strangerFriendly,
        vocalisation,
        description,
        temperament,
        lifeSpan,
        altNames,
        wikipediaUrl,
        cfaUrl,
        vetstreetUrl,
        vcahospitalsUrl,
        referenceImageId,
        imageUrl,
        indoor,
        lap,
        experimental,
        hairless,
        natural,
        rare,
        rex,
        suppressedTail,
        shortLegs,
        hypoallergenic,
        weightImperial,
        weightMetric,
      ];
}
