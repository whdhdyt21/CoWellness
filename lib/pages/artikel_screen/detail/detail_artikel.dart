import 'package:login_api/pages/artikel_screen/artikel.dart';
import 'package:flutter/material.dart';
import 'package:login_api/pages/artikel_screen/models/artikel_list.dart';

class ArtikelDetailScreen extends StatelessWidget {
  const ArtikelDetailScreen({Key? key, required this.artikel})
      : super(key: key);

  final Artikel artikel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 17, 67, 115),
            centerTitle: true,
            title: const Text(
              'ARTIKEL',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white, // Setel warna putih sesuai kebutuhan Anda
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    artikel.topic!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    artikel.title!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    artikel.date!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(artikel.imageUrl!),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text(
                    artikel.source!,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      artikel.description!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
