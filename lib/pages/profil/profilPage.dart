import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profil
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 40, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Colors.deepPurple,
                          child: Icon(Icons.photo_camera, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Apôtre Francklin', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('francklinApotre@email.com', style: TextStyle(color: Colors.grey[700])),
                        Text('Membre depuis Mars 2025', style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Statistiques
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatItem(count: '24', label: 'Événements', color: Colors.purple),
                  _StatItem(count: '3', label: 'Organisés', color: Colors.cyan),
                  _StatItem(count: '4.8', label: 'Note moyenne', color: Colors.orange),
                ],
              ),
              SizedBox(height: 24),
              // Catégories préférées
              Text('Catégories préférées', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _CategoryChip(label: 'Musique'),
                  _CategoryChip(label: 'Culture'),
                  _CategoryChip(label: 'Technologie'),
                  ActionChip(
                    label: Text('+ Ajouter'),
                    onPressed: () {},
                    backgroundColor: Colors.grey[200],
                  ),
                ],
              ),
              SizedBox(height: 24),
              // Événements récents
              Text('Événements récents', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              _EventCard(
                title: 'Festival de Jazz Paris',
                date: '15 Déc 2024',
                status: 'À venir',
                statusColor: Colors.purple,
              ),

              SizedBox(height: 8),
              _EventCard(
                title: 'Conférence Design UX',
                date: '10 Nov 2024',
                status: 'Participé',
                statusColor: Colors.grey,
              ),
              SizedBox(height: 24),
              // Paramètres (placeholder)
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;
  final Color color;

  const _StatItem({required this.count, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: color)),
        Text(label, style: TextStyle(color: Colors.grey[600])),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.purple[50],
      labelStyle: TextStyle(color: Colors.purple),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;

  const _EventCard({
    required this.title,
    required this.date,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          child: Icon(Icons.event, color: Colors.grey[400]),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
