import 'package:flutter/material.dart';
import 'package:flutter_practice/widgets/button.dart';
import 'package:flutter_practice/widgets/card.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Whatup",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 34,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Color.fromARGB(174, 255, 255, 255),
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$ 2,322,120",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: "Transfer",
                      bgColor: Colors.amber,
                      textColor: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      bgColor: Colors.grey,
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Wallets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CurrencyCard(
                  currencyName: "Euro",
                  currencyAcronym: "EUR",
                  amount: "5,323",
                  currencyIcon: Icons.euro_rounded,
                  order: 0,
                ),
                CurrencyCard(
                  currencyName: "Dollar",
                  currencyAcronym: "USD",
                  amount: "1,393",
                  currencyIcon: Icons.attach_money_rounded,
                  isDark: false,
                  order: -2,
                ),
                CurrencyCard(
                  currencyName: "Bitcoin",
                  currencyAcronym: "BTC",
                  amount: "3.200",
                  currencyIcon: Icons.currency_bitcoin_rounded,
                  isDark: true,
                  order: -4,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
