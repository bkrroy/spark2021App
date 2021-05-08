import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spark2021app/constant.dart';
import 'package:spark2021app/states/background_widget.dart';
import 'package:provider/provider.dart';
import 'package:spark2021app/fetching_service.dart';

class PrizesScreen extends StatefulWidget {
  @override
  _PrizesScreenState createState() => _PrizesScreenState();
}

class _PrizesScreenState extends State<PrizesScreen> {
  List<String> prizesList = ['TBD', 'TBD', 'TBD'];

  Future<void> getPrizesList() async {
    final list = await context.read<FetchingService>().getPrizesList();
    setState(() {
      prizesList = list;
    });
  }

  @override
  void initState() {
    getPrizesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF001B31),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left_rounded,
              size: 40,
            ),
          ),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              BackgroundGradientWidget(),
              Container(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Prizes',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        color: kLightBlueColor,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    PrizeRowWidget(
                      prizeImagePath: 'images/firstPrize.png',
                      prizeMoney: prizesList[0],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    PrizeRowWidget(
                      prizeImagePath: 'images/secondPrize.png',
                      prizeMoney: prizesList[1],
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    PrizeRowWidget(
                      prizeImagePath: 'images/thirdPrize.png',
                      prizeMoney: prizesList[2],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrizeRowWidget extends StatelessWidget {
  PrizeRowWidget({this.prizeImagePath, this.prizeMoney});

  final String prizeImagePath;
  final String prizeMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      width: 337,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(prizeImagePath),
          Container(
            height: 86,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: kLightBlueColor,
              ),
            ),
          ),
          Container(
            height: 86,
            width: 213,
            decoration: BoxDecoration(
                color: Color(0xFFCCE5Fb),
                borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                prizeMoney,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
