import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_api/pages/takaran_nutrisi_pakan_screen/takaran_nutrisi_pakan_screen.dart';

class TakaranNutrisiSapiPage extends StatefulWidget {
  const TakaranNutrisiSapiPage({Key? key}) : super(key: key);

  @override
  State<TakaranNutrisiSapiPage> createState() => _TakaranNutrisiSapiPageState();
}

class _TakaranNutrisiSapiPageState extends State<TakaranNutrisiSapiPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _totalSapiController = TextEditingController();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
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
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "JUMLAH SAPI",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 20),
            SvgPicture.asset(
              'assets/img_sapi.svg',
              height: 142,
              width: 118,
            ),
            const SizedBox(height: 40),
            Container(
              height: 80,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 17, 67, 115),
                borderRadius: BorderRadius.circular(50.0),
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
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 80,
                  width: 230,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 17, 67, 115),
                    borderRadius: BorderRadius.circular(20.0),
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
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      controller: _totalSapiController,
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
                          return '   HARAP ISI!';
                        }

                        // Check if the input is a valid number
                        if (int.tryParse(value) == null) {
                          return '   ISI ANGKA!';
                        }

                        return null;
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
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TakaranNutrisiPakanScreen(),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(376.0, 40.0),
                backgroundColor: const Color.fromARGB(255, 17, 67, 115),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                "Selanjutnya",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
