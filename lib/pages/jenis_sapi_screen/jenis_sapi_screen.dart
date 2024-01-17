import 'package:firebase_auth/firebase_auth.dart';
// import 'package:login_api/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_api/core/navigator_service.dart';
import 'package:login_api/pages/jumlah_sapi/jumlah_sapi.dart';
import 'package:login_api/routes/app_routes.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child:
                Text('TAKARAN NUTRISI', style: TextStyle(color: Colors.white)),
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
                Container(
                  height: 24,
                  width: 346,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SAPI FARMER",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakaranNutrisiSapiPage()));
                  },
                  child: Container(
                    height: 80,
                    width: 376,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 17, 67, 115), // Background color
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Transform.translate(
                            offset: Offset(20, 0), // Geser 10 piksel ke kanan
                            child: SvgPicture.asset(
                              'assets/jenis_sapi.svg',
                              height: 60,
                              width: 90,
                            ),
                          ),
                        ),
                        Container(
                          width: 156,
                          child: const Center(
                            child: Text(
                              "SAPI 1",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakaranNutrisiSapiPage()));
                  },
                  child: Container(
                    height: 80,
                    width: 376,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 17, 67, 115), // Background color
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Transform.translate(
                            offset: Offset(20, 0), // Geser 10 piksel ke kanan
                            child: SvgPicture.asset(
                              'assets/jenis_sapi.svg',
                              height: 60,
                              width: 90,
                            ),
                          ),
                        ),
                        Container(
                          width: 156, // Adjusted width to accommodate the image
                          child: const Center(
                            child: Text(
                              "SAPI 2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // SAPI jenis
              ],
            ),
          ),
        ),
      ),
    );
  }
}
