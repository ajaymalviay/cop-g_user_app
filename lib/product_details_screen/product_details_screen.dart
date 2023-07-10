import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  // bool isSelected = false;
  int number =1;
  double Rate = 0;

  List<bool> isSelected = [
    false,false,false,false,false
  ];

  List isSelectedColor = [
    false,false,false,false
  ];

  List sizes = [
    'S','M','L','XL','XXL'
  ];

  List colors = [
    Colors.white,Colors.black,Colors.yellow,Colors.grey

  ];

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Material(
        child: Container(
          color: Colors.grey.shade400,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20,left: 20,right: 25),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle
                              ),
                              child: InkWell(
                                onTap: (){Navigator.pop(context);},
                                child: Icon(Icons.navigate_before,color: Colors.white,size: 40,),
                              ),
                            ),
                            Expanded(child: Container(),),

                          ],
                        ),
                      ),
                      Image.asset('assets/images/shoes_image.jpg'),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 30,left: 20,right: 25,bottom: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("foot wear shoes",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),),
                                      const SizedBox(height: 5,),
                                      const Text('Sneaker',style: TextStyle(fontSize: 16),),
                                      const SizedBox(height: 5,),

                                      RatingBar.builder(
                                        itemBuilder: (context, index) => Icon(Icons.star,color: Colors.amber,),
                                        itemCount: 5,
                                        direction: Axis.horizontal,
                                        itemSize: 20,
                                        maxRating: 5,
                                        minRating: 1,
                                        initialRating: 3.5,
                                        ignoreGestures: true,
                                        allowHalfRating: true,
                                        updateOnDrag: true,
                                        onRatingUpdate: (Ratingvalue){
                                          setState(() {
                                            Rate = Ratingvalue  ;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Expanded(child: Container()),
                                  Column(
                                    children: [
                                      Container(
                                        decoration:BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(

                                                onTap: (){
                                                  setState(() {
                                                    if(number>1){
                                                      number--;
                                                    }
                                                  });
                                                },
                                                // behavior: ,
                                                child:const Padding(
                                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                                                  child: Text('-',style: TextStyle(color: Colors.black,fontSize: 25),),
                                                ) ),

                                            Text(number.toString(),style: TextStyle(fontSize:18),),
                                            GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  if(number>=1){
                                                    number++;
                                                  }
                                                });
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                                                child: Text('+',style: TextStyle(fontSize: 25,color: Colors.black),),
                                              ),)
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      const Text('Available In Stock',style: TextStyle(fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25,),
                              const Text('Size',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              // SizedBox(height: 15 ,),
                              Container(
                                height: 65,
                                child: ListView.builder(
                                  // padding: EdgeInsets.all(8),
                                    itemCount:2,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index){
                                      String size = sizes[index];
                                      bool isSelectedSize = isSelected[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isSelected = List.generate(isSelected.length, (i) => i== index);

                                            });
                                          },
                                          child: Container(
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: isSelectedSize ? Colors.black:Colors.white,
                                              border: Border.all(color: Colors.black),
                                              shape: BoxShape.circle,

                                            ),
                                            child: Center(
                                                child: Text(size,
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      color: isSelectedSize?Colors.white:Colors.black
                                                  ),)),
                                          ),
                                        ),
                                      );

                                    }
                                ),
                              ),

                              // color
                              SizedBox(height: 10,),
                              Text('Color',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                              // SizedBox(height: 15 ,),
                              Container(
                                height: 60,
                                child: ListView.builder(
                                  // padding: EdgeInsets.all(8),
                                    itemCount: colors.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext context, int index){
                                      Color color = colors[index];
                                      bool isColor = isSelectedColor[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isSelectedColor = List.generate(isSelectedColor.length, (i) => i== index);

                                            });
                                          },
                                          child: Container(
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: color,
                                                border: Border.all(color: Colors.grey),
                                                shape: BoxShape.circle,
                                              ),
                                              child: isColor
                                                  ?Icon(Icons.check_outlined,color: Colors.redAccent,)
                                                  :null

                                          ),
                                        ),
                                      );
                                    }
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Description',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              SizedBox(height: 5,),
                              Text('A shoe is an item of footwear intended to protect and comfort the human foot')
                            ],
                          ),
                        ),

                      ),

                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 90,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Total price'),
                        Text('Rs 500',style: TextStyle(
                            fontSize: 22,fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.shopping_bag_outlined,color: Colors.white,),
                            SizedBox(width:15,height: 60,),
                            Text('Add to cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 25,)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
