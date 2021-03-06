import 'package:ecommerce_template/providers/allProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeProductBox extends StatefulWidget {
  final String sizeText;
  SizeProductBox({this.sizeText});
  @override
  _SizeProductBoxState createState() => _SizeProductBoxState();
}

class _SizeProductBoxState extends State<SizeProductBox> {
  bool borderOn = true;
  @override
  Widget build(BuildContext context) {
    final allposts = Provider.of<AllProviders>(context, listen: true);

    return InkWell(
      onTap: () {
        setState(() {
          borderOn = !borderOn;
          allposts.isAnySizeSelected(widget.sizeText);
          allposts.setPriceAndQuantity(widget.sizeText);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          // boxShadow: <BoxShadow>[
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.9),
          //     spreadRadius: 0.5,
          //     blurRadius: 1.5,
          //   ),
          // ],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
            color: AllProviders.selectedSize != widget.sizeText
                ? Colors.grey.withOpacity(0.1)
                : Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(top: 8, left: 5, right: 5),
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.rectangle),
            child: Center(
                child: Text(
              widget.sizeText,
              style: TextStyle(
                  fontSize:
                      AllProviders.selectedSize != widget.sizeText ? 19 : 22),
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ),
    );
  }
}
