import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:CoWellness/pages/jumlah_sapi/jumlah_sapi.dart';

class JenisSapiScreen extends StatefulWidget {
  JenisSapiScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  State<JenisSapiScreen> createState() => _JenisSapiScreenState();
}

class _JenisSapiScreenState extends State<JenisSapiScreen> {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Widget _buildCowCard(String title, String imageAsset, String description) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const TakaranNutrisiSapiPage()),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageAsset),
                  fit: BoxFit.cover,
                ),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
            // Tambahkan aksi yang sesuai ketika ikon profil diklik
          },
          icon: const Icon(Icons.account_circle),
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
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 25,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 80,
                width: 376,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                    255,
                    17,
                    67,
                    115,
                  ), // Background color
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Rounded corners
                ),
                child: const Center(
                  child: Text(
                    "PILIH JENIS SAPI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildCowCard(
                "Sapi Brahman",
                "https://cdnwpseller.gramedia.net/wp-content/uploads/2022/11/brahman-608x403.jpg",
                "Sapi brahman merupakan sapi yang berasal dari India dan merupakan keturunan dari bos indiscuss atau yang juga dikenal sebagai sapi zebu.",
              ),
              const SizedBox(height: 10),
              _buildCowCard(
                "Sapi Simental",
                "https://cdnwpseller.gramedia.net/wp-content/uploads/2022/11/sapi-simmental-608x426.jpg",
                "Sapi simmental merupakan jenis sapi yang berasal dari daerah Simme, Swiss. Jenis sapi perah dan pedaging ini mempunyai bentuk tubuh yang kekar dan berotot",
              ),
              const SizedBox(height: 10),
              _buildCowCard(
                "Sapi Bali",
                "https://cdnwpseller.gramedia.net/wp-content/uploads/2022/11/bali-608x341.jpg",
                "Sapi bali adalah salah satu ternak asli Indonesia. Jenis sapi pekerja ini memiliki tenaga dan daya tahan yang tinggi",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
