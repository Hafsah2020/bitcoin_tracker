import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedValue = 'USD';
  bool loading = false;
  // Map<String, dynamic>? btcValue;
  // Map<String, dynamic>? ethValue;
  // Map<String, dynamic>? ltcValue;
  List<Map<String, dynamic>?> coinValues = [];
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

  Future<void> getIt() async {
    setState(() {
      loading = true;
    });
    for (String i in cryptoList) {
      Map<String, dynamic> dat = await CoinData().getData(selectedValue, i);
      coinValues.add(dat);
    }
    // Map<String, dynamic> dat1 =
    //     await CoinData().getData(selectedValue, cryptoList[0]);
    // Map<String, dynamic> dat2 =
    //     await CoinData().getData(selectedValue, cryptoList[1]);
    // Map<String, dynamic> dat3 =
    //     await CoinData().getData(selectedValue, cryptoList[2]);

    // print(dat);
    // btcValue = dat1;
    // ethValue = dat2;
    // ltcValue = dat3;
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt();
  }

  @override
  Widget build(BuildContext context) {
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
              child: Column(children: [
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '${text}',
                      loading
                          ? 'loadinng...'
                          : '1 $selectedValue = ${coinValues[0]!['rate']} BTC',
                      // : '1 $selectedValue = ${btcValue!['rate']} BTC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '${text}',
                      loading
                          ? 'loadinng...'
                          : '1 $selectedValue = ${coinValues[1]!['rate']} ETH',
                      // : '1 $selectedValue = ${ethValue!['rate']} ETH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlueAccent,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      // '${text}',
                      loading
                          ? 'loadinng...'
                          : '1 $selectedValue = ${coinValues[2]!['rate']} LTC',
                      // : '1 $selectedValue = ${ltcValue!['rate']} LTC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ])),
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
                  getIt();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
