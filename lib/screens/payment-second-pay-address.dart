import 'package:ecommerce_template/Templates/address-order-template.dart';
import 'package:ecommerce_template/providers/cart.dart';
import 'package:ecommerce_template/providers/languages.dart';
import 'package:ecommerce_template/screens/addresses-screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentSecondPayAddress extends StatefulWidget {
  PageController c;
  PaymentSecondPayAddress({this.c});

  @override
  _PaymentSecondPayAddressState createState() =>
      _PaymentSecondPayAddressState();
}

class _PaymentSecondPayAddressState extends State<PaymentSecondPayAddress> {
  String radioItem;

  @override
  Widget build(BuildContext context) {
    final carPro = Provider.of<CartProvider>(context);
    final lang = Provider.of<Languages>(context);

    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              lang.translation['shippingAddressTitle']
                  [Languages.selectedLanguage],
              style: TextStyle(color: Theme.of(context).bottomAppBarColor),
            ),
            Divider(
              endIndent: 100,
              indent: 100,
            ),
            carPro.selectedAddress != null
                ? AddressOrderTemplate(carPro.selectedAddress, false)
                : Text(
                    lang.translation['noAddressSelectred']
                        [Languages.selectedLanguage],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).bottomAppBarColor,
                    ),
                  ),
            SizedBox(
              height: 20,
            ), // this is the order address template
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 20),
              child: RaisedButton(
                child: Text(
                  lang.translation['EditAddress'][Languages.selectedLanguage],
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressesScreen(),
                      ));
                },
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(lang.translation['PaymentTitle'][Languages.selectedLanguage],
                style: TextStyle(color: Theme.of(context).bottomAppBarColor)),
            Divider(
              endIndent: 100,
              indent: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                          lang.translation['payOnDelivered']
                              [Languages.selectedLanguage],
                          style: TextStyle(
                              color: Theme.of(context).bottomAppBarColor)),
                      Radio(
                        value: lang.translation['continue']
                            [Languages.selectedLanguage],
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: radioItem,
                        onChanged: (val) {
                          setState(() {
                            radioItem = val;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Credit Card / Debit Card',
                        style: TextStyle(
                            fontSize: 17, color: Colors.grey.withOpacity(0.9)),
                      ),
                      Radio(
                        value: 'Credit Card / Debit Card',
                        activeColor: Theme.of(context).primaryColor,
                        groupValue: radioItem,
                        onChanged: null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            RaisedButton(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    lang.translation['continue'][Languages.selectedLanguage],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              onPressed: () {
                if (carPro.selectedAddress != null && radioItem != null) {
                  carPro.getTotalPrice(0.0);

                  widget.c.animateToPage(2,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                } else {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      content: Text(
                        lang.translation['pleaseSelectValidShippingAddress']
                            [Languages.selectedLanguage],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 35),
                      ),
                      title: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.warning,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                      elevation: 2,
                    ),
                  );
                }
              },
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
