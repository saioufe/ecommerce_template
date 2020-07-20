import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:ecommerce_template/Templates/favorite-item-template.dart';
import 'package:ecommerce_template/providers/allProviders.dart';
import 'package:ecommerce_template/providers/languages.dart';
import 'package:ecommerce_template/widgets/favorite-no.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent) {
    print("BACK BUTTON!"); // Do some stuff.
    Provider.of<AllProviders>(context, listen: false).NavBarShow(true);
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final allPro = Provider.of<AllProviders>(context);
    final lang = Provider.of<Languages>(context, listen: false);

    return WillPopScope(
      onWillPop: () {
        allPro.NavBarShow(true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          centerTitle: true,
          title: Container(
            margin: EdgeInsets.all(16),
            child: Text(
              lang.translation['FavoriteTitle'][Languages.selectedLanguage],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: allPro.numOfFavorite == 0
            ? Center(
                child: FavoriteNoProducts(),
              )
            : SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 20, bottom: 40),
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: allPro.allProducts.map((element) {
                        if (allPro.favoriteList[element.id] == true) {
                          return FavoriteItemTemplate(
                            product: element,
                          );
                        } else {
                          return SizedBox();
                        }
                      }).toList(),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
