import 'package:flutter/material.dart';

class Donativos extends StatefulWidget {
  final donativos;
  Donativos({Key? key, required this.donativos}) : super(key: key);

  @override
  State<Donativos> createState() => _DonativosState();
}



class _DonativosState extends State<Donativos> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donativos Obtenidos'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(children: [
            ListTile(
              leading: Image.asset("assets/paypal.png"),
              trailing: Text("${widget.donativos["paypal"] ?? 0.0}", style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height:24),
            ListTile(
              leading: Image.asset("assets/tarjeta_de_credito.png"),
              trailing: Text("${widget.donativos["tarjeta"] ?? 0.0}", style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height:24),
            Divider(color:Colors.black),
            ListTile(
              leading: Icon(Icons.attach_money, size: 64),
              trailing: Text("${widget.donativos["acomulado"] ?? 122.0}", style: TextStyle(fontSize: 32)),
            ),
            SizedBox(height:24),
            SizedBox(height:24),
            Container(
              child: widget.donativos["img"], alignment: Alignment.center,
            )
          ],),
        ),
      );
  }
}