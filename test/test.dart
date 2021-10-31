import 'package:test/test.dart';
import 'package:test3astronautas/src/controllers/home_controller.dart';
import 'package:test3astronautas/src/models/square_model.dart';


void main() {
  HomeController homeCtrl = HomeController();

  homeCtrl.createMatrix(5);

  test("Create Matrix Fail, length is no equals", (){
    expect(
    homeCtrl.matrix!.length, 
    5, 
    );
  });


  test("Cannot find number of islands", (){
    expect(
      homeCtrl.findIslands(),
      isNonZero, 
    );
  });

  test("Verify number of islands", (){
    
    List<List<SquareModel>> matrix = [
      [SquareModel(1),SquareModel(0),SquareModel(0),SquareModel(1)],
      [SquareModel(0),SquareModel(0),SquareModel(0),SquareModel(0)],
      [SquareModel(0),SquareModel(1),SquareModel(0),SquareModel(0)],
      [SquareModel(1),SquareModel(0),SquareModel(0),SquareModel(1)],
    ];

    homeCtrl.setMatrix = matrix;
    expect(
      homeCtrl.findIslands(),
      equals(4) 
    );
  });



}