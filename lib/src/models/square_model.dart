class SquareModel{
  int? value;
  bool visited = false;

  int get color{

    return (value==1?0xFF272c33:0xFF6aabd2);
  }

  SquareModel( this.value );

  void toggleValue(){
    value= value==1?0:1;
  }

  @override
  String toString() {
    return """
    valor: $value,
    visitado: $visited
    """;
  }
}