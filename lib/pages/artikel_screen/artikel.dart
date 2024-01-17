import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_api/core/navigator_service.dart';
import 'package:login_api/pages/artikel_screen/detail/detail_artikel.dart';
import 'package:login_api/pages/artikel_screen/models/artikel_list.dart';
import 'package:flutter/material.dart';
import 'package:login_api/routes/app_routes.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({Key? key}) : super(key: key);

  @override
  State<ArtikelScreen> createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('ARTIKEL', style: TextStyle(color: Colors.white)),
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
        body: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: ListView.builder(
            itemCount: artikelList.length,
            itemBuilder: (context, index) {
              Artikel artikel = artikelList[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF114373)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    // Panggil metode untuk menavigasi ke layar detail artikel dengan indeks yang benar
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetailScreen(
                                  artikel: artikelList[index],
                                )));
                  },
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artikel
                              .topic!, // Gantilah ini dengan properti topik yang sesuai
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 10,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                            height:
                                4), // Berikan sedikit spasi antara teks topik dan judul
                        Text(
                          artikel.title!,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      artikel.date!,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 10,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Image.network(
                      artikel.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
