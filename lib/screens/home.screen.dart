import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'calculator.screen.dart';

class Home extends StatelessWidget {
  static const String id = 'Home_screen';

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    double letterSize = 50;
    double numberSize = 80;

    List<String> partyTypes = ['beer', 'water', 'snacks', 'whiskey'];
    Random random = new Random();
    int randomPartyType = random.nextInt(partyTypes.length);
    int randomQtGuests = random.nextInt(150) + 1;

    return MaterialApp(
        title: 'Plan a Party',
        theme: ThemeData(
          primaryColor: Colors.red,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'Do you know how many ',
                        style: GoogleFonts.pTSans(
                            textStyle: TextStyle(
                                color: Color(0xff989898),
                                fontSize: letterSize)),
                        children: <TextSpan>[
                          TextSpan(
                              text: partyTypes[randomPartyType].toString(),
                              style: GoogleFonts.pTSans(
                                  textStyle: TextStyle(
                                      backgroundColor: Color(0xff6E6E6E),
                                      color: Color(0xffFCFCFC)))),
                          TextSpan(
                            text: ' are needed for \na party with\n',
                            style: GoogleFonts.pTSans(
                                textStyle: TextStyle(
                                    color: Color(0xff989898),
                                    fontSize: letterSize)),
                          ),
                          TextSpan(
                            text: randomQtGuests.toString(),
                            style: GoogleFonts.pTSans(
                                textStyle: TextStyle(
                                    color: Color(0xff6E6E6E),
                                    fontSize: numberSize,
                                    fontWeight: FontWeight.w800)),
                          ),
                          TextSpan(
                            text: ' \npeople?',
                            style: GoogleFonts.pTSans(
                                textStyle: TextStyle(
                                    color: Color(0xff989898),
                                    fontSize: letterSize)),
                          )
                        ]),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.arrow_forward,
                          color: (Color(0xff6E6E6E)), size: 40),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Calculator(
                            qtPeople: randomQtGuests,
                          ),
                        )),
                  )
                ],
              ),
            )),
          ),
        ));
  }
}
