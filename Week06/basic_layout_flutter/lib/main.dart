import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangang Park',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final ratings = const Padding(
    padding: EdgeInsets.symmetric(vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.blue),
            Icon(Icons.star, color: Colors.blue),
            Icon(Icons.star, color: Colors.blue),
            Icon(Icons.star, color: Colors.blue),
            Icon(Icons.star_half, color: Colors.blue),
          ],
        ),
        Text(
          '250 Reviews',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: 'Roboto',
            letterSpacing: 0.5,
            fontSize: 20,
          ),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hangang Park'), centerTitle: true),
      body: ListView(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'images/hangang_park.png',
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hangang Park',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Hangang Park is a riverside park along the Han River in Seoul. '
                        'It is a popular spot for cycling, picnics, and outdoor activities, '
                        'offering beautiful sunset views and vibrant festivals.',
                        softWrap: true,
                      ),
                      ratings,
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          InfoColumn(icon: Icons.access_time, label: '24 Hours'),
                          InfoColumn(icon: Icons.location_on, label: 'Seoul'),
                          InfoColumn(icon: Icons.park, label: 'Public Park'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'images/hangang_park.png',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Popular Spots in Hangang Park',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(
                  child: GalleryItem(
                    image: 'images/cycling.png',
                    title: 'Cycling Route',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GalleryItem(
                    image: 'images/picnic.png',
                    title: 'Picnic Area',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: GalleryItem(
                    image: 'images/festival.png',
                    title: 'Festival & Fireworks',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Things To Do & Food Around',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 12),
          ..._buildListTiles(),
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  const InfoColumn({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

class GalleryItem extends StatelessWidget {
  final String image;
  final String title;
  const GalleryItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, fit: BoxFit.cover, height: 100),
        ),
        const SizedBox(height: 8),
        Text(title, textAlign: TextAlign.center),
      ],
    );
  }
}

// Daftar hiburan & kuliner
List<Widget> _buildListTiles() {
  return [
    _tile('Cycling by the Han River', 'Bike rentals & long riverside paths', Icons.directions_bike),
    _tile('Hangang River Cruise', 'Night view of Seoul skyline', Icons.directions_boat),
    _tile('Outdoor Swimming Pools', 'Open during summer season', Icons.pool),
    _tile('Banpo Bridge Rainbow Fountain', 'Famous night water show', Icons.water),
    _tile('Han River Fireworks Festival', 'Annual autumn event', Icons.celebration),

    const Divider(thickness: 2, height: 32, color: Colors.grey),

    _tile('Kimbap Picnic Set', 'Rice rolls with side dishes', Icons.rice_bowl),
    _tile('Fried Chicken & Beer', 'Popular Korean picnic combo', Icons.local_drink),
    _tile('Tteokbokki', 'Spicy rice cakes', Icons.fastfood),
    _tile('Hotteok', 'Sweet pancake with syrup', Icons.cake),
    _tile('Bingsu', 'Korean shaved ice dessert', Icons.icecream),
  ];
}

ListTile _tile(String title, String subtitle, IconData icon) {
  return ListTile(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
    ),
    subtitle: Text(subtitle),
    leading: Icon(icon, color: Colors.blue[500]),
  );
}
