import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_api/pages/takaran_nutrisi_hasil_page/takaran_nutrisi_hasil_page.dart';

class TakaranNutrisiPakanScreen extends StatefulWidget {
  TakaranNutrisiPakanScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<TakaranNutrisiPakanScreen> createState() =>
      _TakaranNutrisiPakanScreenState();
}

class _TakaranNutrisiPakanScreenState extends State<TakaranNutrisiPakanScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool? _isChecked = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;
  bool? _isChecked4 = false;

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
                      "PILIH PAKAN SAPI",
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 67, 115),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/rumput.svg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RUMPUT GAJAH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Fiber 100%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 17, 67, 115),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        activeColor: const Color.fromARGB(255, 17, 67, 115),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 67, 115),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/rumput.svg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RUMPUT GAJAH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Fiber 100%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 17, 67, 115),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Checkbox(
                        value: _isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked2 = value!;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        activeColor: const Color.fromARGB(255, 17, 67, 115),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 67, 115),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/rumput.svg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RUMPUT GAJAH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Fiber 100%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 17, 67, 115),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Checkbox(
                        value: _isChecked3,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked3 = value!;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        activeColor: const Color.fromARGB(255, 17, 67, 115),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 300,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 17, 67, 115),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/rumput.svg'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "RUMPUT GAJAH",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Fiber 100%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 17, 67, 115),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Checkbox(
                        value: _isChecked4,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked4 = value!;
                          });
                        },
                        visualDensity: VisualDensity.compact,
                        activeColor: const Color.fromARGB(255, 17, 67, 115),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TakaranNutrisiHasilPage()));
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
                // SAPI jenis 2
              ],
            ),
          ),
        ),
      ),
    );
  }
}
