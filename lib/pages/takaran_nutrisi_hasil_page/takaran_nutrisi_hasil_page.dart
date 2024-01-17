import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore_for_file: must_be_immutable
class TakaranNutrisiHasilPage extends StatefulWidget {
  const TakaranNutrisiHasilPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<TakaranNutrisiHasilPage> createState() =>
      _TakaranNutrisiHasilPageState();
}

class _TakaranNutrisiHasilPageState extends State<TakaranNutrisiHasilPage> {
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('FORUM', style: TextStyle(color: Colors.white)),
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
          padding: EdgeInsets.symmetric(
            horizontal: 26,
            vertical: 35,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildThirty(context),
                SizedBox(height: 24),
                Text("Nutrisi", style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 2),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: _buildSeventeen(
                    context,
                    userImage: "ME",
                    value: "300",
                    unit: "Kcal/kg",
                  ),
                ),
                SizedBox(height: 2),
                Divider(),
                SizedBox(height: 35),
                _buildNote(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Section Widget
Widget _buildThirty(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 14,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF114373), // Ubah warna sesuai dengan kebutuhan Anda
      borderRadius: BorderRadius.circular(
          10), // Sesuaikan nilai sesuai dengan keinginan Anda
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/jenis_sapi.svg',
          height: 50,
          width: 42,
          // margin: EdgeInsets.symmetric(vertical: 10),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 9,
            bottom: 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("JENIS : SAPI FARMER STARTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  )),
              SizedBox(height: 5),
              Text("ME: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  )),
              SizedBox(height: 4),
              Text("CP: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                    height: 0,
                  )),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    ),
  );
}

/// Section Widget
Widget _buildNote(BuildContext context) {
  return Container(
    height: 180,
    padding: EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 9,
    ),
    decoration: BoxDecoration(
      color: Color.fromARGB(
          255, 48, 129, 208), // Ubah warna sesuai dengan kebutuhan Anda
      borderRadius: BorderRadius.circular(
          10), // Sesuaikan nilai sesuai dengan keinginan Anda
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 117),
          child: Text("CATATAN :",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
        ),
        Expanded(
          child: Container(
            width: 289,
            margin: EdgeInsets.only(
              left: 5,
              bottom: 67,
            ),
            child: Text(
              '''Sapi anda sehat, terus semangat agar bisa dibunuh dan mendapat cuan, setelah itu anda dapat rebahan rebahan dan rebahan.

Bersemangatlah, selalu senyum dan k sabar
''',
              maxLines: 5,
              style: TextStyle(color: Colors.white),
              // overflow: TextOverflow.ellipatWhiteA700,
            ),
          ),
        ),
      ],
    ),
  );
}

/// Common widget
Widget _buildSeventeen(
  BuildContext context, {
  required String userImage,
  required String value,
  required String unit,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        userImage,
        style: TextStyle(fontWeight: FontWeight.w700),
        // style: theme.textTheme.labelLarge!.copyWith(
        //   color: Colors.black,
        // ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w700),
            // style: theme.textTheme.labelLarge!.copyWith(
            //   color: Colors.black,
            // ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80),
            child: Text(
              unit,
              style: TextStyle(fontWeight: FontWeight.w700),
              // style: theme.textTheme.labelLarge!.copyWith(
              //   color: Colors.black,
              // ),
            ),
          ),
        ],
      ),
    ],
  );
}
