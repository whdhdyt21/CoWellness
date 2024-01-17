import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_api/component/custom_image_view.dart';
import 'package:login_api/core/image_constant.dart';
import 'package:login_api/core/navigator_service.dart';
import 'package:login_api/routes/app_routes.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class TakaranNutrisiSapiPage extends StatefulWidget {
   TakaranNutrisiSapiPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<TakaranNutrisiSapiPage> createState() => _TakaranNutrisiSapiPageState();
}

class _TakaranNutrisiSapiPageState extends State<TakaranNutrisiSapiPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
      builder: return SafeArea(
          child: Scaffold(
            appBar: AppBar(
            title: Center(
              child: Text('FORUM', style: TextStyle(color: Colors.white)),
            ),
            backgroundColor: Color.fromARGB(255, 17, 67, 115),
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
              padding: EdgeInsets.only(
                left: 26,
                top: 50,
                right: 26,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      "JUMLAH SAPI",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomImageView(
                      imagePath: ImageConstant.imgGroup,
                      height: 142,
                      width: 118,
                    ),
                    SizedBox(height: 58),
                    Container(
                      height: 80,
                      width: double.infinity, // Menggunakan lebar maksimum
                      // Warna latar belakang
                      padding: EdgeInsets.all(
                          10.0), // Jarak antara teks dan tepi container
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            255, 17, 67, 115), // Warna latar belakang
                        borderRadius: BorderRadius.circular(
                            10.0), // Menjadikan sudut bulat
                      ),
                      child: Center(
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
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceEvenly, // atau sesuai kebutuhan Anda
                      children: [
                        Container(
                          height: 80,
                          width: 260,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(
                                255, 17, 67, 115), // Warna latar belakang
                            borderRadius: BorderRadius.circular(
                                10.0), // Menjadikan sudut bulat
                          ),
                          child: Center(
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
                                color: Color.fromARGB(255, 17, 67, 115),
                              ), // Atur warna dan gaya garis batas
                              borderRadius: BorderRadius.circular(
                                  10.0), // Atur sudut border box
                            ),
                            child: TextFormField(
                              style: TextStyle(
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
                    SizedBox(height: 80),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // onTapSelanjutnya(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(376.0, 60.0),
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Color.fromARGB(255, 136, 161, 185), // Warna teks
                      ),
                      child: Text(
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
          ),
        );
      }
    
  }

  /// Section Widget



// onTapSelanjutnya(BuildContext context) {
//   NavigatorService.pushNamed(
//     AppRoutes.takaranNutrisiPakanScreen,
//   );
// }
