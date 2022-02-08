import 'package:donativos_app/donativos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? currentSelectedRadio;
  int? currentDropItem;
  double acomulado = 0.0;
  double total = 10000;
  double progresso = 0.0;
  double paypal = 0.0;
  double tarjeta = 0.0;
  bool metacumplida = false;
  Image img = Image.asset("assets/vacio1.jpg");

  var assetsRadioGroup={
    0: "assets/paypal.png",
    1: "assets/tarjeta_de_credito.png",
  };

  var radioGroup={
    0: "paypal",
    1: "tarjeta",
  };
  var dropItemsGroup = {
    0: 100, 
    1: 200, 
    2: 500, 
    3: 1000, 
    4: 10000
  };

  radioGroupGenerator(){
    return radioGroup.entries
      .map((radioItem) => ListTile(
        leading: Image.asset(assetsRadioGroup[radioItem.key]!,
        height:64,
        width:32),
        title: Text("${radioItem.value}"),
        trailing: Radio(
          value: radioItem.key, 
          groupValue: currentSelectedRadio, 
          onChanged: (newSelectedRadio){
            currentSelectedRadio=newSelectedRadio as int?;
            setState(() {
              
            });
          }
      ))).toList();
  }
  dropDownItemGenerator() {
    return dropItemsGroup.entries
        .map(
          (dropDownElement) => DropdownMenuItem(
              value: dropDownElement.value,
              child: Text('${dropDownElement.value}')),
        )
        .toList();
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Donaciones'),
        ),
        body: Column(children: [
          ListTile(
            title: Text('Es para una buena causa', style: TextStyle(fontSize: 25)),
            subtitle: Text('Elija el modo de donativo')
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  left: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
    
              ),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: radioGroupGenerator()),
            ),
          ),
          ListTile(
            title: Text("Cantidad a donar:"),
            trailing: DropdownButton(
              items: dropDownItemGenerator(), 
              value: currentDropItem,
              onChanged: (int? selected) {  
                currentDropItem = selected;
                setState(() {});
              },   
            )
          ),
          LinearProgressIndicator(minHeight: 24, value: progresso),
          Container(
            child:
              Text('${(progresso * 100).toStringAsPrecision(4)}%'),
              alignment: Alignment.center,
          ),
          TextButton(
            onPressed: (){
              if(currentSelectedRadio==0){
                paypal+=currentDropItem ?? 0;
                acomulado += currentDropItem ?? 0;
                if(acomulado<10000){
                progresso = acomulado/total;
              }
                else{
                  progresso=1;
                  img = new Image.asset("assets/gracias1.jpg");
                }
              }
              else{
                tarjeta+=currentDropItem ?? 0;
                acomulado += currentDropItem ?? 0;
                if(acomulado<10000){
                progresso = acomulado/total;

              }
                else{
                  progresso=1;
                  img = new Image.asset("assets/gracias1.jpg");
                }
              }
              setState(() {});
            }, 
            child: Text("Donar")),
        ])
        ,
        floatingActionButton: FloatingActionButton(
          child: 
            Icon(Icons.remove_red_eye_rounded),
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>Donativos(donativos: {"paypal": paypal,"tarjeta": tarjeta,"acomulado": acomulado,"metacumplida": metacumplida, "img": img},),
                ));
            },),
      );
  }
}