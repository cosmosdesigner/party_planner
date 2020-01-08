import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class GetSvgs {
  getSVG(String svgType){
    String assetName = 'assets/svg/$svgType.svg';
     Widget svg = SvgPicture.asset(
        assetName,
        height: 40,
        semanticsLabel: 'SVGs'
    );

     return svg;
  }
}