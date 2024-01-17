import 'package:flutter/material.dart';
import 'package:login_api/pages/artikel_screen/artikel.dart';
import 'package:login_api/pages/artikel_screen/detail/detail_artikel.dart';
import 'package:login_api/pages/artikel_screen/models/artikel_list.dart';
import 'package:login_api/pages/jumlah_sapi/jumlah_sapi.dart';

class AppRoutes {
  static const String artikelScreen = '/artikel_screen';

  static const String takaranNutrisiSapiPage = '/takaran_nutrisi_sapi_page';

  static const String artikelDetailScreen = '/artikel_screen/detail';

  static Map<String, WidgetBuilder> get routes => {
        takaranNutrisiSapiPage: ((context) => TakaranNutrisiSapiPage()),
        artikelDetailScreen: (context) {
          // Ganti dengan logika yang sesuai untuk mendapatkan objek Artikel berdasarkan indeks atau identifikasi unik

          // Dapatkan objek artikel dari argumen yang dikirimkan saat navigasi
          Artikel selectedArtikel =
              ModalRoute.of(context)!.settings.arguments as Artikel;

          return ArtikelDetailScreen(artikel: selectedArtikel);
        },
        artikelScreen: (context) => ArtikelScreen(),
      };
}
