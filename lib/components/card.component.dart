import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/planAParty.model.dart';
import '../helpers/suisseKnife.helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardOfFood extends StatefulWidget {
  final String typeOfCard;
  CardOfFood({Key key, @required this.typeOfCard}) : super(key: key);

  @override
  _CardOfFoodState createState() => _CardOfFoodState();
}

class _CardOfFoodState extends State<CardOfFood> {
  HelperParty partyHelper = new HelperParty();
  SvgPicture iconToBeApplied;
  double result;
  String cardName;
  Map<String, dynamic> cardJson;

  double margin = 30.0;
  double widthComp = 190;

  cardTypes typeCardJson;

  void buildCardContent() {
    cardJson = jsonDecode(widget.typeOfCard);
    String str = cardJson['type'].toString();
    typeCardJson =
        cardTypes.values.firstWhere((type) => type.toString() == str);
    iconToBeApplied = partyHelper.getCardIconTypeFromType(typeCardJson);
    result = partyHelper.getValueFromQtPeople(
        typeCardJson, int.parse(cardJson['qtPeople']));
    cardName = partyHelper.getValueFromType(typeCardJson);
  }

  @override
  void initState() {
    super.initState();
    buildCardContent();
  }

  @override
  Widget build(BuildContext context) {
    buildCardContent();
    return Container(
        width: widthComp,
        margin: EdgeInsets.all(margin),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: iconToBeApplied,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(
                      cardName +
                          ' (' +
                          partyHelper.getUnitByType(typeCardJson) +
                          ')',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    partyHelper.removeDecimalZeroFormat(result),
                    style: TextStyle(
                      fontSize: 45,
                      color: Color(0xff6e6e6e),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        decoration: new BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x12000000),
              blurRadius: 20.0, // has the effect of softening the shadow
              spreadRadius: 10.0, // has the effect of extending the shadow
              offset: Offset(
                0, // horizontal, move right 10
                0, // vertical, move down 10
              ),
            )
          ],
          borderRadius: new BorderRadius.all(Radius.circular(10)),
        ));
  }
}
