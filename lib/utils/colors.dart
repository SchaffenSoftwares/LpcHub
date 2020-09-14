import 'package:flutter/material.dart';
import 'dart:ui';

const appOrange = const Color(0xFFFB8C00);
const primaryAppColor= Colors.black12;

const primaryColor = const Color(0xFFFF5252);
const primaryLight = const Color(0xFFFF5252);
const primaryDark = const Color(0xFFFF5252);

const secondaryColor = const Color(0xFFFF5252);
const secondaryLight = const Color(0xFFFF5252);
const secondaryDark = const Color(0xFFFF5252);

const Color gradientStart = const Color(0xFF485563);
const Color gradientEnd = const Color(0xFF29323C);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientStart, gradientEnd],
  stops: const [0.0,0.5 ,1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFFFD60A3), Color(0xFFFF5252)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFf4e3e3), Color(0xFFf4e3e3)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

String sampleDesc="IBM, the leading supplier of computer equipment to commercial enterprises at the time, approached Microsoft in July 1980 concerning software for its upcoming personal computer, the IBM PC.[55] IBM first proposed that Microsoft write the BASIC interpreter. IBM's representatives also mentioned that they needed an operating system, and Gates referred them to Digital Research (DRI), makers of the widely used CP/M operating system.[56] IBM's discussions with Digital Research went poorly, however, and they did not reach a licensing agreement. IBM representative Jack Sams mentioned the licensing difficulties during a subsequent meeting with Gates and asked if Microsoft could provide an operating system. A few weeks later, Gates and Allen proposed using 86-DOS, an operating system similar to CP/M, that Tim Paterson of Seattle Computer Products (SCP) had made for hardware similar to the PC.[57] Microsoft made a deal with SCP to be the exclusive licensing agent of 86-DOS, and later the full owner. Microsoft employed Paterson to adapt the operating system for the PC[58] and delivered it to IBM as PC DOS for a one-time fee of 50,000.[59] ";