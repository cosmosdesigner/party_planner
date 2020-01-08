import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/card.component.dart';
import '../models/planAParty.model.dart';
import '../helpers/suisseKnife.helper.dart';

import 'package:admob_flutter/admob_flutter.dart';
import '../helpers/getIDAdMob.helper.dart';

class Calculator extends StatefulWidget {
  static const String id = 'Calculator_screen';

  final int qtPeople;
  Calculator({Key key, @required this.qtPeople}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<Widget> _cardsCalculated = [];
  double letterSize = 50;
  double numberSize = 80;
  final controller = PageController(initialPage: 1);
  var txtController = TextEditingController(text: '');
  var typesOfCards = [
    cardTypes.snacks,
    cardTypes.candy,
    cardTypes.water,
    cardTypes.whiskey,
    cardTypes.beer,
    cardTypes.wine,
    cardTypes.soda,
  ];
  int changerCounter = 0;
  int maxChangerCounter = 5;

  void buildArrayOfCards(bool firstTime) {
    firstTime
        ? typesOfCards.forEach((type) {
            _cardsCalculated.add(
              CardOfFood(
                  typeOfCard:
                      '{"type": "$type", "qtPeople": "${txtController.text}"}'),
            );
          })
        : typesOfCards.asMap().forEach(
              (index, type) => {
                _cardsCalculated[index] = CardOfFood(
                    typeOfCard:
                        '{"type": "$type", "qtPeople": "${txtController.text}"}')
              },
            );
  }

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    super.initState();
    txtController = TextEditingController(text: widget.qtPeople.toString());
    buildArrayOfCards(true);
    loadAdMobBanner();
  }

  Widget loadAdMobBanner() => AdmobBanner(
        adUnitId: getBannerAdUnitId(),
        adSize: AdmobBannerSize.BANNER,
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          handleEvent(event, args, 'Banner');
        },
      );

  updateCards(text) {
    if (txtController.text == null || txtController.text == '') return;
    this.setState(() {
      _debouncer.run(() {
        buildArrayOfCards(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'How many people are coming to the party?',
                        style: TextStyle(
                            color: Color(0xff989898), fontSize: letterSize),
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        updateCards(text);
                      },
                      controller: txtController,
                      style: TextStyle(
                          color: Color(0xff6E6E6E),
                          fontSize: numberSize,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '0',
                      ),
                    ),
                    SizedBox(
                      height: 245,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: _cardsCalculated.map((card) => card).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: loadAdMobBanner(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
