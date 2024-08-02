import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:taxiui/Components/Atoms/Alignments/SpaceAlignment.dart';
import 'package:taxiui/Components/Atoms/Buttons/solidButton.dart';
import 'package:taxiui/Components/Atoms/Inputs/roundedInputFiled.dart';
import 'package:taxiui/Components/Pages/loginPage.dart';
import 'package:taxiui/locationMapScreen.dart';

void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
