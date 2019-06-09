import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //TODO:Link up images
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true; //to know whether it is turn of cross or circle
  String message; //To show message whether circle is win or a cross
  List<String> gameState;

  //TODO: Initilize the state of box with empty
  
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      setState(() {
              this.gameState = [
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
              ];

              this.message= "";
            });
    }
  //TODO: playGame method

    playGame(int index){
      if(this.gameState[index] == 'empty'){
        setState(() {
                  if (this.isCross) {
                    this.gameState[index] = "cross";
                  }else{
                    this.gameState[index] = "circle";

                  }
                  this.isCross = !this.isCross;
                  this.checkWin();
                });
      }
    }
  //TODO: restGame Method
    resetGame(){
      Future.delayed(const Duration(milliseconds: 500), () {

      // Here you can write your code

        setState(() {
          // Here you can write your code for open new view
          
              this.gameState = [
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
                "empty",
              ];
              this.message="";
            
        });

      });
      
    }
  //TODO:getImage Method 

    //Method to get images and this methods return type is AssetImage
    AssetImage getImage(String value){
      switch (value) {
        case ('empty'):
          return edit;
          break;
        case ('cross'):
          return cross;
          break;
        case ('circle'):
          return circle;
          break;
        
      }
    }
  //TODO:Check for win logic

  checkWin(){
    if ((this.gameState[0]!='empty')&&
        (this.gameState[0]==this.gameState[1])&&
        (this.gameState[1]==this.gameState[2])
    ) {
      setState(() {
        this.message = '${this.gameState[0]} Wins';
        this.resetGame();      
            });
    } else if((this.gameState[3]!='empty')&&
        (this.gameState[3]==this.gameState[4])&&
        (this.gameState[4]==this.gameState[5])){
          setState(() {
           this.message = '${this.gameState[3]} Wins'; 
           this.resetGame();      

                 });
    }else if((this.gameState[6]!='empty')&&
        (this.gameState[6]==this.gameState[7])&&
        (this.gameState[7]==this.gameState[8])){
          setState(() {
           this.message = '${this.gameState[6]} Wins'; 
           this.resetGame();      

                 });
    }else if((this.gameState[0]!='empty')&&
        (this.gameState[0]==this.gameState[3])&&
        (this.gameState[3]==this.gameState[6])){
          setState(() {
           this.message = '${this.gameState[0]} Wins'; 
          this.resetGame();      

                 });
    }else if((this.gameState[1]!='empty')&&
        (this.gameState[1]==this.gameState[4])&&
        (this.gameState[4]==this.gameState[7])){
          setState(() {
           this.message = '${this.gameState[1]} Wins'; 
        this.resetGame();      

                 });
    }else if((this.gameState[2]!='empty')&&
        (this.gameState[2]==this.gameState[5])&&
        (this.gameState[5]==this.gameState[8])){
          setState(() {
           this.message = '${this.gameState[2]} Wins';
           this.resetGame();      

                 });
    }else if((this.gameState[0]!='empty')&&
        (this.gameState[0]==this.gameState[4])&&
        (this.gameState[4]==this.gameState[8])){
          setState(() {
           this.message = '${this.gameState[0]} Wins';
           this.resetGame();      

                 });
    }else if((this.gameState[6]!='empty')&&
        (this.gameState[6]==this.gameState[4])&&
        (this.gameState[4]==this.gameState[2])){
          setState(() {
           this.message = '${this.gameState[6]} Wins'; 
           this.resetGame();      

                 });
    }else if(!gameState.contains('empty')){
      setState(() {
              this.message = "Game Draw!!!";
                   

            });
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed:(){
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(this.gameState[i]),
                  ),
                  ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message, style:TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
            
          ),
         Material(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
           clipBehavior: Clip.antiAlias,
            child:MaterialButton(
            color:Colors.blueAccent,
            splashColor:Colors.blueGrey,
            minWidth: 300.0,
            height: 50.0,
            child: Text("Reset Game",style:TextStyle(color: Colors.white,fontSize: 20.0)),
            onPressed: (){
              this.resetGame();
            },
          ),
         ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("Project by AKSHAY",style:TextStyle(fontSize: 18.0)),
          )
        ],
      )
    );
  }
}