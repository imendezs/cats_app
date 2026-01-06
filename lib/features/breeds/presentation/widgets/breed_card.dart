import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/breed.dart';

class BreedCard extends StatelessWidget {
  final Breed breed;
  final VoidCallback onTap;

  const BreedCard({
    super.key,
    required this.breed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      breed.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(context, Icons.location_on, breed.origin),
                    Row(
                      children: [
                        Icon(Icons.psychology, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          'Inteligencia: ${breed.intelligence}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: onTap,
                          child: const Text('Más...'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: breed.imageUrl != null
          ? CachedNetworkImage(
              imageUrl: breed.imageUrl!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                width: 100,
                height: 100,
                color: Colors.grey[200],
                child: const Icon(Icons.pets, size: 40),
              ),
            )
          : Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: const Icon(Icons.pets, size: 40),
            ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
