import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD';
  List<DropdownMenuItem> getDropItems() {
    List<DropdownMenuItem> dropItems = [];
    for (String coin in currenciesList) {
      dropItems.add(DropdownMenuItem(
        child: Text(coin),
        value: coin,
      ));
    }
    return dropItems;
  }

  // option make text separately and pass it as parameter
  //pass the function as a data

  Future<String> getIt() async {
    dynamic dat = await CoinData().getData();
    print(dat);
    return dat;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt();
  }

  @override
  Widget build(BuildContext context) {
    String text = '${getIt()}';
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  // '${text}',
                  '1 $selectedValue = 400 BTC',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedValue,
              items: getDropItems(),
              onChanged: (dynamic value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
