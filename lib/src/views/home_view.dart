import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/appbar_view.dart';


class HomeView extends GetView<HomeController> {



  const HomeView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    controller.createMatrix(5);
    controller.update();
    return Scaffold(
      appBar: myAppBar,
      body: GetBuilder(
        init: controller,
        builder: (_)=>_body(),
      )
    );
  }

  ListView _body(){

    return ListView(
      children: [
        _matrixSlider(),
        const SizedBox(height:  10),
        _drawMatrix(),
        _numberIslands()
      ],
    );
  }

  Card _matrixSlider(){

    return Card(
      shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin    : const EdgeInsets.all(15),
      elevation : 10,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text("Select the matrix length",
                style: Get.textTheme.headline2,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: Slider(
                min: 3,
                max: 10,
                divisions: 10,
                activeColor: const Color(0xFF385e72),
                label: controller.matrix!.length.toString(),
                value: controller.matrix!.length.toDouble(),
                onChanged: (double number){
                  controller.createMatrix(number.toInt());
                  controller.update();
                },
              )
            ),
          ),
          
        ],
      ),
    );

  }

  Container _squareIcons(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
            Image.asset("sea-icon.png", width: 50,),
            Text("sea", style:Get.textTheme.headline2),
            const SizedBox(width: 30),
            Image.asset("island-icon.png", width: 30,),
            Text("island", style:Get.textTheme.headline2)
          ],
        )
      );
  }


  Center _drawMatrix(){

    List<Widget> squares = _getSquares(controller.matrix);

    return Center(
      child: Container(
        height: Get.height*0.58,
        margin: const EdgeInsets.all(10),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: controller.matrix?.length ?? 0,
          children: squares,
        ),
      ),
    );
  }


  List<Widget> _getSquares(var matrix){
    List<Widget> squares = List.empty(growable: true);
    int matrixLength = controller.matrix?.length ??  0;

    for( int i=0; i <  matrixLength ; i++ ){
      for( int j=0; j <  matrixLength ; j++ ){
        squares.add(
          ElevatedButton(
            key: GlobalKey(),
            onPressed: () {

              controller.matrix![i][j].toggleValue();
              controller.update();
            },
            child: Text(
              '${controller.matrix![i][j].value}',
              style: TextStyle(
                color: Color(controller.matrix![i][j].value == 1?0xFFf1f2f2: 0xFFf1f2f2),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(controller.matrix![i][j].color),
              padding: const EdgeInsets.all(8),
            ),
          )
        );
      }
    }

    return squares;


  }

  Card _numberIslands(){

    return Card(
      shape     : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin    : const EdgeInsets.all(15),
      elevation : 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _squareIcons(),
            Text("Number of Islands", style: Get.textTheme.headline2),
            Text(controller.findIslands().toString(), style: const TextStyle(
                fontWeight:  FontWeight.bold,
                fontSize: 25
              )
            )
          ],
        )
      )
    );

  }



}
