import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/pages/artikel_screen/detail/detail_artikel.dart';
import 'package:login_api/pages/artikel_screen/models/artikel_list.dart';

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
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: _buildArticleList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Center(
        child: Text(
          'ARTIKEL',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'YourFont', // Use an appropriate font
            fontSize: 20, // Adjust the font size
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 67, 115),
      elevation: 4,
      leading: IconButton(
        onPressed: () {
          // Add appropriate action for the profile icon
        },
        icon: const Icon(Icons.account_circle),
        color: Colors.white,
      ),
      actions: [
        IconButton(
          onPressed: signUserOut,
          icon: const Icon(Icons.logout),
          color: Colors.white,
        ),
      ],
    );
  }

  ListView _buildArticleList() {
    return ListView.builder(
      itemCount: artikelList.length,
      itemBuilder: (context, index) {
        Artikel artikel = artikelList[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: const Color(0xFF114373)),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArtikelDetailScreen(
                    artikel: artikelList[index],
                  ),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    artikel.imageUrl!,
                    fit: BoxFit.cover,
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        artikel.topic!,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        artikel.title!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16, // Adjusted font size
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        artikel.date!,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
