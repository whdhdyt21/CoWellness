import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:login_api/pages/takaran_nutrisi_pakan_screen/takaran_nutrisi_pakan_screen.dart';

// ignore_for_file: must_be_immutable
class TakaranNutrisiSapiPage extends StatefulWidget {
  const TakaranNutrisiSapiPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<TakaranNutrisiSapiPage> createState() => _TakaranNutrisiSapiPageState();
}

class _TakaranNutrisiSapiPageState extends State<TakaranNutrisiSapiPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('TAKARAN NUTRISI', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: const Color.fromARGB(255, 17, 67, 115),
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          left: 26,
          top: 50,
          right: 26,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Text(
                "JUMLAH SAPI",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              SvgPicture.asset(
                'assets/img_sapi.svg',
                height: 142,
                width: 118,
              ),
              const SizedBox(height: 58),
              Container(
                height: 80,
                width: double.infinity, // Menggunakan lebar maksimum
                // Warna latar belakang
                padding: const EdgeInsets.all(
                    10.0), // Jarak antara teks dan tepi container
                decoration: BoxDecoration(
                  color: const Color.fromARGB(
                      255, 17, 67, 115), // Warna latar belakang
                  borderRadius:
                      BorderRadius.circular(10.0), // Menjadikan sudut bulat
                ),
                child: const Center(
                  child: Text(
                    "MASUKKAN TOTAL SAPI ANDA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // atau sesuai kebutuhan Anda
                children: [
                  Container(
                    height: 80,
                    width: 260,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 17, 67, 115), // Warna latar belakang
                      borderRadius:
                          BorderRadius.circular(10.0), // Menjadikan sudut bulat
                    ),
                    child: const Center(
                      child: Text(
                        "TOTAL SAPI",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 17, 67, 115),
                        ), // Atur warna dan gaya garis batas
                        borderRadius: BorderRadius.circular(
                            10.0), // Atur sudut border box
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Color.fromARGB(255, 17, 67, 115),
                          fontSize: 33,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '   HARAP ISI!'; // Pesan error jika field kosong
                          }
                          return null; // Return null jika validasi berhasil
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                          hintStyle: TextStyle(
                            color: Colors.black87.withOpacity(0.5),
                            fontSize: 33,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TakaranNutrisiPakanScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(376.0, 40.0),
                  foregroundColor: Colors.white,
                  backgroundColor:
                      const Color.fromARGB(255, 136, 161, 185), // Warna teks
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Sesuaikan nilai sesuai keinginan
                  ),
                ),
                child: const Text(
                  "Selanjutnya",
                  style: TextStyle(
                    fontSize: 20, // Ukuran teks
                    fontWeight: FontWeight.bold, // Ketebalan teks
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
