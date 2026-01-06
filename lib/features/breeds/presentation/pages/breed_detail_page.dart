import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/breed.dart';

class BreedDetailPage extends StatelessWidget {
  final Breed breed;

  const BreedDetailPage({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildImageHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (breed.weightMetric != null || breed.weightImperial != null) ...[
                    _buildInfoCard(context, Icons.monitor_weight, 'Peso',
                        breed.weightMetric != null ? '${breed.weightMetric} kg' : '${breed.weightImperial} lbs'),
                    const SizedBox(height: 12),
                  ],
                  _buildInfoCard(context, Icons.location_on, 'País de Origen', breed.origin),
                  const SizedBox(height: 12),
                  _buildInfoCard(context, Icons.calendar_today, 'Esperanza de Vida', '${breed.lifeSpan} años'),
                  const SizedBox(height: 24),
                  Text('Características', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  _buildRatingRow(context, 'Inteligencia', breed.intelligence),
                  _buildRatingRow(context, 'Adaptabilidad', breed.adaptability),
                  _buildRatingRow(context, 'Nivel de Afecto', breed.affectionLevel),
                  _buildRatingRow(context, 'Amigable con Niños', breed.childFriendly),
                  _buildRatingRow(context, 'Amigable con Perros', breed.dogFriendly),
                  _buildRatingRow(context, 'Nivel de Energía', breed.energyLevel),
                  _buildRatingRow(context, 'Necesidad de Aseo', breed.grooming),
                  _buildRatingRow(context, 'Problemas de Salud', breed.healthIssues),
                  _buildRatingRow(context, 'Nivel de Muda', breed.sheddingLevel),
                  _buildRatingRow(context, 'Necesidades Sociales', breed.socialNeeds),
                  _buildRatingRow(context, 'Amigable con Extraños', breed.strangerFriendly),
                  _buildRatingRow(context, 'Vocalización', breed.vocalisation),
                  const SizedBox(height: 24),
                  Text('Descripción', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(breed.description, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.justify),
                  const SizedBox(height: 24),
                  Text('Temperamento', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: breed.temperament.split(',').map((t) => Chip(
                      label: Text(t.trim()),
                      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    )).toList(),
                  ),
                  if (breed.hypoallergenic == 1) _buildBadge(Icons.check_circle, 'Hipoalergénico', Colors.green),
                  if (breed.rare == 1) _buildBadge(Icons.star, 'Raza Rara', Colors.amber),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageHeader(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          Positioned.fill(
            child: breed.imageUrl != null
                ? CachedNetworkImage(
                    imageUrl: breed.imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(color: Colors.grey[200], child: const Center(child: CircularProgressIndicator())),
                    errorWidget: (context, url, error) => Container(color: Colors.grey[200], child: const Icon(Icons.pets, size: 80)),
                  )
                : Container(color: Colors.grey[200], child: const Icon(Icons.pets, size: 80)),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 8,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
              style: IconButton.styleFrom(backgroundColor: Colors.black45),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Text(
              breed.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(offset: Offset(0, 2), blurRadius: 8, color: Colors.black87)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, IconData icon, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 4),
                  Text(value, style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(BuildContext context, String label, int rating) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
              Text('$rating/5', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: rating / 5,
              minHeight: 8,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(rating >= 4 ? Colors.green : rating >= 3 ? Colors.orange : Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(IconData icon, String label, MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Card(
        color: color.shade50,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, color: color.shade700),
              const SizedBox(width: 8),
              Text(label, style: TextStyle(color: color.shade700, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
