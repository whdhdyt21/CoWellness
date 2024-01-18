import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_api/component/bottom_bar.dart';
import 'package:login_api/pages/jenis_sapi_screen/jenis_sapi_screen.dart';

void signUserOut() async {
  await FirebaseAuth.instance.signOut();
}

class TakaranNutrisiHasilPage extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'title': 'Rumput Hijau:',
      'imageUrl':
          'https://mesinpencacahrumput.com/wp-content/uploads/2019/01/Cara-Menanam-Rumput-Gajah.jpg',
      'subtitle': 'Takaran: 30-35 kg/ekor/hari',
    },
    {
      'title': 'Jerami:',
      'imageUrl':
          'https://www.ransumternak.distan.jogjaprov.go.id/img/artikel/fermentasi%20jerami.jpg',
      'subtitle': 'Takaran: 6-8 kg/ekor/hari',
    },
    {
      'title': 'Konsentrat:',
      'imageUrl':
          'https://2.bp.blogspot.com/-6U3IRey5R4E/VtVqen1EJPI/AAAAAAAAAnQ/kYhhLR4IhSw/s1600/teknologi%2Bpengolahan%2Bpakan%2Bkonsentrat.jpg',
      'subtitle': 'Takaran: 1–2% dari bobot badan sapi/ekor/hari',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'TAKARAN NUTRISI',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 67, 115),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomBar()),
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _buildCard(context, data[index]);
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, Map<String, String> cardData) {
    return Card(
      color: const Color(0xFF114373),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardData['title']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 12),
                Image.network(
                  cardData['imageUrl']!,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 12),
                Text(
                  cardData['subtitle']!,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
