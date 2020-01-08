import '../models/planAParty.model.dart';
import '../helpers/svgLibrary.svgs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';

class HelperParty {
  String cardType;
  SvgPicture cardIconType;
  int valuePerPerson;
  GetSvgs svgHandler = new GetSvgs();

  String removeDecimalZeroFormat(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 1);
  }

  List<dynamic> _buildSwitchesFromType(cardTypes cardType) {
    List cardContent = [];
    switch (cardType) {
      case cardTypes.snacks:
        cardContent = [
          svgHandler.getSVG('sandwich'),
          valuesPerType[cardType],
          'Snacks',
          'Un'
        ];
        break;
      case cardTypes.water:
        cardContent = [
          svgHandler.getSVG('water'),
          valuesPerType[cardType] / 1000,
          'Water',
          'L'
        ];
        break;
      case cardTypes.whiskey:
        cardContent = [
          svgHandler.getSVG('whiskey'),
          valuesPerType[cardType],
          'Whiskey',
          'Bottle'
        ];
        break;
      case cardTypes.beer:
        cardContent = [
          svgHandler.getSVG('beer'),
          valuesPerType[cardType],
          'Beer',
          'Cans'
        ];
        break;
      case cardTypes.candy:
        cardContent = [
          svgHandler.getSVG('candy'),
          valuesPerType[cardType],
          'Sweets and Candys',
          'Un'
        ];
        break;
      case cardTypes.wine:
        cardContent = [
          svgHandler.getSVG('wine'),
          valuesPerType[cardType],
          'Wine',
          'Bottle'
        ];
        break;
      case cardTypes.soda:
        cardContent = [
          svgHandler.getSVG('soda'),
          valuesPerType[cardType] / 1000,
          'Soda',
          'L'
        ];
        break;
    }
    return cardContent;
  }

  SvgPicture getCardIconTypeFromType(cardTypes cardType) {
    return _buildSwitchesFromType(cardType)[0];
  }

  double getValueFromQtPeople(cardTypes cardType, int qtPeople) {
    return _buildSwitchesFromType(cardType)[1] * qtPeople;
  }

  String getValueFromType(cardTypes cardType) {
    return _buildSwitchesFromType(cardType)[2];
  }
  String getUnitByType(cardTypes cardType) {
    return _buildSwitchesFromType(cardType)[3];
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({ this.milliseconds });

  run(VoidCallback action) {
    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
