import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_api/pages/takaran_nutrisi_hasil_page/takaran_nutrisi_hasil_page.dart';

class TakaranNutrisiPakanScreen extends StatefulWidget {
  const TakaranNutrisiPakanScreen({Key? key}) : super(key: key);

  @override
  State<TakaranNutrisiPakanScreen> createState() =>
      _TakaranNutrisiPakanScreenState();
}

class _TakaranNutrisiPakanScreenState extends State<TakaranNutrisiPakanScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  bool? _isChecked1 = false;
  bool? _isChecked2 = false;
  bool? _isChecked3 = false;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

//minimal 3 checkbox terpilih, kalo kurang dari 3, maka muncul alert dialog
  bool _validateCheckboxes() {
    if (_isChecked1 == true && _isChecked2 == true && _isChecked3 == true) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Peringatan'),
            content: const Text('Pilih minimal 3 pakan'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }
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
              buildHeaderContainer(),
              const SizedBox(height: 40),
              buildPakanMiniCard(
                title: "Rumput Hijau",
                imageUrl:
                    "https://mesinpencacahrumput.com/wp-content/uploads/2019/01/Cara-Menanam-Rumput-Gajah.jpg",
                checkboxValue: _isChecked1,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked1 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildPakanMiniCard(
                title: "Jerami",
                imageUrl:
                    "https://www.ransumternak.distan.jogjaprov.go.id/img/artikel/fermentasi%20jerami.jpg",
                checkboxValue: _isChecked2,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked2 = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              buildPakanMiniCard(
                title: "Konsentrat Pakan Ternak",
                imageUrl:
                    "https://2.bp.blogspot.com/-6U3IRey5R4E/VtVqen1EJPI/AAAAAAAAAnQ/kYhhLR4IhSw/s1600/teknologi%2Bpengolahan%2Bpakan%2Bkonsentrat.jpg",
                checkboxValue: _isChecked3,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked3 = value!;
                  });
                },
              ),
              const SizedBox(height: 80),
              buildElevatedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeaderContainer() {
    return Container(
      height: 80,
      width: 376,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 67, 115),
        borderRadius: BorderRadius.circular(10.0),
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
    );
  }

  Widget buildPakanMiniCard({
    required String title,
    required String imageUrl,
    required bool? checkboxValue,
    required Function(bool?) onChanged,
  }) {
    return Container(
      height: 80,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 17, 67, 115),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 17, 67, 115),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Checkbox(
              value: checkboxValue,
              onChanged: onChanged,
              visualDensity: VisualDensity.compact,
              activeColor: const Color.fromARGB(255, 17, 67, 115),
              checkColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_validateCheckboxes()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TakaranNutrisiHasilPage(),
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
    );
  }
}
