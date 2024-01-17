import 'package:flutter/material.dart';
import 'package:login_api/pages/artikel_screen/artikel.dart';
import 'package:login_api/pages/forum_discusion.dart';
import 'package:login_api/pages/jenis_sapi_screen/jenis_sapi_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: _getPage(_currentIndex),
      bottomNavigationBar: Container(
        height: 70, // Set the desired height
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: bluePrimary,
          selectedItemColor: white,
          unselectedItemColor: white.withOpacity(.40),
          selectedLabelStyle: textTheme.bodySmall,
          unselectedLabelStyle: textTheme.bodySmall,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              label: 'NUTRISI',
              icon: Icon(Icons.pets),
            ),
            BottomNavigationBarItem(
              label: 'PENGINGAT',
              icon: Icon(Icons.alarm),
            ),
            BottomNavigationBarItem(
              label: 'ARTIKEL',
              icon: Icon(Icons.article_outlined),
            ),
            BottomNavigationBarItem(
              label: 'DROP',
              icon: Icon(Icons.pin_drop),
            ),
            BottomNavigationBarItem(
              label: 'FORUM',
              icon: Icon(Icons.forum),
            ),
          ],
        ),
      ),
    );
  }


  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return JenisSapiScreen();
      case 1:
        return Container();
      case 2:
        return ArtikelScreen();
      case 3:
        return Container();
      case 4:
        return ForumDiscusion();
      default:
        return Container(); // Handle other cases if necessary
    }
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        labelLarge: base.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: white,
        bodyColor: white,
      );
}

const ColorScheme _shrineColorScheme = ColorScheme(
  primary: bluePrimary,
  secondary: shrinePink50,
  surface: shrineSurfaceWhite,
  background: shrineBackgroundWhite,
  error: shrineErrorRed,
  onPrimary: white,
  onSecondary: white,
  onSurface: white,
  onBackground: white,
  onError: shrineSurfaceWhite,
  brightness: Brightness.light,
);

const Color shrinePink50 = Color(0xFFFEEAE6);
const Color bluePrimary = Color(0xFF114373);
const Color shrinePink300 = Color(0xFFFBB8AC);
const Color shrinePink400 = Color(0xFFEAA4A4);

const Color white = Color.fromRGBO(255, 255, 255, 1);
const Color shrineBrown600 = Color.fromRGBO(200, 182, 166, 1);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;
