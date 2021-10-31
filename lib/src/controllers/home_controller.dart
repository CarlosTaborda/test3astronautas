import 'package:get/get.dart';
import 'dart:math';
import 'package:flutter/material.dart';

import '../models/square_model.dart';


class HomeController extends GetxController{
  
  List<List<SquareModel>> _matrix = List.empty(growable: true);
  List<List<SquareModel>>? get matrix => _matrix;
  GlobalKey formKey = GlobalKey<FormState>();

  set setMatrix(List<List<SquareModel>> mat)=>_matrix = mat;


  void createMatrix(int length){

    Random random = Random();
    _matrix = List.filled(length, List.filled(length, SquareModel(0)));

    for( int i = 0; i<length; i++ ){

      List<SquareModel> column = List.empty(growable: true);
      for( int j = 0; j<length; j++){
        
        column.add(SquareModel(random.nextInt(2)));

      }
      
      _matrix[i] = column;
    }
  }

  void resetSearch(){
    for( int i = 0; i<_matrix.length; i++ ){

      for( int j = 0; j<_matrix.length; j++){

        _matrix[i][j].visited = false;

      }

    }
  }

  void visitAllSquares(int row, int column, int lengthMatrix){

    
    int currentRow = row>0?row-1: row;
    int endRow= row<lengthMatrix-1?row+1: row;
    int currentColumn = column>0?column-1: column;
    int endColumn = column<lengthMatrix-1?column+1: column;

    

    
    _matrix[row][column].visited= true;// flag for visited current square
    
    for( int i = currentRow; i <= endRow; i++ ){
      for( int j = currentColumn; j <= endColumn; j++ ){
  
        if( !_matrix[i][j].visited && _matrix[i][j].value == 1 ){
          visitAllSquares(i, j, lengthMatrix);// call recursive for square with earth
          
        }

      }
    }
    

  }


  int findIslands(){
    resetSearch();
    int countIslands = 0;

    for( int i = 0; i<_matrix.length; i++ ){

      for( int j = 0; j<_matrix.length; j++){

        if( ! _matrix[i][j].visited && _matrix[i][j].value == 1){
          
          // visit all neigthbors, max 8 for square
          visitAllSquares(i, j, _matrix.length);
          countIslands++;
        }

      }

    }

    return countIslands;

  }

  


}