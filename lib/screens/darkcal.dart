import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:calculater/screens/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_gradient/smooth_gradient.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool  isDark = true;
  String text = "0";
  String fullText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

  body: Container(
    width: double.infinity, 
    height: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      gradient: LinearGradient(
        colors: [
         isDark? Color(0xFF373737): Color(0xFFF9F9F9),
         isDark? Color(0xFF252628): Color(0xFFF3F3F3),
  
          isDark? Color(0xFF000309): Color(0xFFE5E5E5),
          
        ],
        stops: [isDark?0:.13,   isDark? .23 : .33,1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,

      )
    ),
    child: Column(
      children: [
        SizedBox(height: 52.h,),
        /////// switch to light and dark theme :)
        SizedBox(
          width: 122.h,
          height: 44.h,
          child: AnimatedToggleSwitch<bool>.dual(
               current: isDark,
                  first: false,
                  second: true,
                    onChanged: (val) => setState(() => isDark = val),

                      iconBuilder: (value) => Icon(
                        value ? Icons.nightlight_round : Icons.wb_sunny_outlined,
                        color: value? Colors.white :Colors.black,
                      ),
                       textBuilder: (value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.wb_sunny_outlined,
          color: !isDark
              ? Colors.transparent
              : Color(0xffFBFBFB).withOpacity(0.4),
              size: 30.sp,
        ),
        Icon(
          Icons.nightlight_outlined,
          size: 30.sp,
          color: isDark
              ? Colors.transparent
              :  Color(0xff373737).withOpacity(0.4),
        ),
        
      ],
    );
  },
                      
                        style: ToggleStyle(
                          
                          backgroundGradient: LinearGradient(
                            colors: isDark?[Color(0xFF1B6A9C),Color(0xFF1B6A9C)]:[Color(0xFFA9DCFD),Color(0xFFA9DCFD)],
                          ),
                          indicatorColor: isDark? Color(0xFF003661) :Color(0xFFD8EEFF),
                          
                        ),
                        borderWidth: 0,
                      ),
                     
        ),
        ////////////////////////////////////////////////
        SizedBox(height:141.h ,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  34),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(fullText,
                  maxLines: 1,
                  style: TextStyle(fontFamily: "Poppins",fontSize: 22.sp,color:isDark? Color(0xffFBFBFB).withOpacity(.5): Color(0xff373737).withOpacity(.5),fontWeight: FontWeight.w500)),
                ],
              ),
              SizedBox(height: 8.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                
                children: [
                  Text("=",style: TextStyle(fontFamily: "Poppins",fontSize: 26.sp,color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontWeight: FontWeight.w600)),
                 SizedBox(width: 8.w,),
                  Expanded(child: Text(text,
                  textAlign:TextAlign.right ,
                                    maxLines: 1,
                  overflow:TextOverflow.ellipsis ,
                  style: TextStyle(fontFamily: "Poppins",fontSize: 40.sp,color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontWeight: FontWeight.w600))),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h ,),
        Stack(
          children: [
            Container(
              
              height:507.h ,
              width:423.w ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w),topRight: Radius.circular(30.w)),
                color: Colors.black,
                gradient: LinearGradient(colors: [
                  isDark?Color.fromARGB(255, 161, 221, 240):Color(0xff9EE8FF),
                  isDark?Color.fromARGB(255, 98, 159, 185):Color(0xff5ACEFF),
                 
                 isDark? Color(0xff224E91):Color(0xff79AFFF),
                 isDark? Color(0xff00123F):Color(0xff2D5FDE),
                  
                ]
                ,stops: [.02,.28,.65,1],
                begin:isDark? Alignment.topRight: Alignment.bottomLeft,
                end:  isDark? Alignment.bottomLeft: Alignment.topRight,
                
                ),
                boxShadow: [BoxShadow(blurRadius: 70,offset: Offset(0, -5),spreadRadius: 0,color: Color(0xff000000).withOpacity(.1))]
                
              ),
              
            ),
            Container(
              //the main 
              padding: EdgeInsets.only(left: 34.w,right: 34.w,top: 26.h,bottom: 51.h),
              height:507.h ,
              width: 423.w,
             decoration: BoxDecoration(
               color:isDark? Color(0xff002235).withOpacity(.78):Color(0xffE6F6FF).withOpacity(.2),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30.w),topRight: Radius.circular(30.w)),

             ),
             child: Row(
               children: [
                //column 1 row + numbers
                       Column(
                         children: [
                          ////////////////top row Container
                           Container(
                                    height: 70.h,
                                   width:260.w ,
                                   decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(40),
                                         color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),
                                          boxShadow: [BoxShadow(blurRadius: 15,offset: Offset(0, 3),spreadRadius: 0,color: Color(0xff000000).withOpacity(.05))]
                                                      
                                           ),
                                    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      InkWell(
        onTap: (){
          setState(() {
            text="0";
            
          });
          
        },
        child: Container(
          height: 70.h,
          width: 70.w,
          child: Center(child: Text("AC",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
        ),
      ),
      InkWell(
        onTap: (){
         
          setState(() {
            text=text.substring(0,text.length-1);
             if(text.length==0){setState(() {
            text="0";
          });}
          });
        },
        child: Container(
          height: 70.h,
          width: 70.w,
          child: Center(child: 
          Icon(Icons.cancel_rounded,color:isDark? Color(0xffFBFBFB):
           Color(0xff373737),size: 40.sp,)
          
           ),
        ),
      ),
      InkWell(
        onTap: (){
                      if(text.endsWith("+")||text.endsWith("-")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text;
                return;
              });
            }
            else{
              setState(() {
              fullText=text;
              text=calculate(text+"/100");

            });
            }
            
            
          },
        
        child: Container(
          height: 70.h,
          width: 70.w,
          child: Center(child: Text("%",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
        ),
      ),
      
                                             
    ],),
                                  ),
                              SizedBox(height: 20.h,),
                              ///////////Numbers 
                              Row(
                                
                                children: [
                                ///عمود الارقام
                                Container(
                                  height: 340.h,
                                  width: 70.w,
                                  child: Column(
                                    spacing: 20.h,
                                    children: [
                                    InkWell(
                                      onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="1";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"1";
                                            });
                                          }
                                      },
                                      child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("1",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                        ),
                                    ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="4";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"4";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("4",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="7";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"7";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("7",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                       
                                            setState(() {
                                              text=text+".";
                                            });
                                          
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text(".",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                    
                                  ],))
                             ,SizedBox(width: 25.w,)

                              , Container(
                                  height: 340.h,
                                  width: 70.w,
                                  child: Column(
                                    spacing: 20.h,
                                    children: [
                                    InkWell(
                                      onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="2";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"2";
                                            });
                                          }
                                      },
                                      child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("2",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                        ),
                                    ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="5";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"5";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("5",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="8";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"8";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("8",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="0";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"0";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("0",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                    
                                  ],))
                              ,SizedBox(width: 25.w,)
                              , Container(
                                  height: 340.h,
                                  width: 70.w,
                                  child: Column(
                                    spacing: 20.h,
                                    children: [
                                    InkWell(
                                      onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="3";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"3";
                                            });
                                          }
                                      },
                                      child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("3",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                        ),
                                    ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="6";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"6";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("6",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="9";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"9";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("9",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                       InkWell(
                                        onTap: (){
                                        if (text=="0"){
                                          setState(() {
                                            text="0";
                                          });
                                        }
                                         else{
                                            setState(() {
                                              text=text+"00";
                                            });
                                          }
                                      },
                                         child: Container(
                                          height: 70.h,
                                          width: 70.w,
                                          decoration: BoxDecoration(color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),shape: BoxShape.circle),
                                          child: Center(child: Text("00",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
                                                                               ),
                                       ),
                                    
                                  ],))
                              ,
                              
                              
                              ],)    
                         ],
                       ),
                       SizedBox(width: 25.w,),
                  // coulmn 2 +-*/
                 Container(
       height: 430.h,
       width:70.w ,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(40),
         color: isDark?Color(0xff050505).withOpacity(.3):Color(0xffFFFFFF).withOpacity(.3),
          boxShadow: [BoxShadow(blurRadius: 15,offset: Offset(0, 3),spreadRadius: 0,color: Color(0xff000000).withOpacity(.05))]
    
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
         InkWell(
          onTap: (){
            if(text.endsWith("+")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text.substring(0,text.length-1);
                text=text+"÷";
              });
            }else{text=text+"÷";}
            
          },
           child: Container(
             height: 70.h,
             width: 70.w,
             child: Center(child: Text("÷",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
           ),
         ),
         InkWell(
                    onTap: (){
            if(text.endsWith("+")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text.substring(0,text.length-1);
                text=text+"×";
              });
            }else{text=text+"×";}
            
          },
           child: Container(
             height: 70.h,
             width: 70.w,
             child: Center(child: Text("×",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
           ),
         ),
         InkWell(
          onTap: (){
            if(text.endsWith("+")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text.substring(0,text.length-1);
                text=text+"+";
              });
            }else{text=text+"+";}
            
          },
           child: Container(
             height: 70.h,
             width: 70.w,
             child: Center(child: Text("+",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
           ),
         ),
         InkWell(
          onTap: (){
            if(text.endsWith("+")||text.endsWith("-")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text.substring(0,text.length-1);
                text=text+"-";
              });
            }else if(text=="0"){
              setState(() {
                text="-";
              });
            }
            else{text=text+"-";}
            
          },
           child: Container(
             height: 70.h,
             width: 70.w,
             child: Center(child: Text("-",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
           ),
         ),
         InkWell(
          onTap: (){
            if(text.endsWith("+")||text.endsWith("-")||text.endsWith("×")||text.endsWith("÷")){
              setState(() {
                text=text;
                return;
              });
            }
            else{
              setState(() {
              fullText=text;
              text=calculate(text);

            });
            }
            
            
          },

           child: Container(
             height: 70.h,
             width: 70.w,
             decoration: BoxDecoration(color:isDark? Color(0xff050505).withOpacity(.2):Color(0xffFFFFFF).withOpacity(.2),shape: BoxShape.circle),
             child: Center(child: Text("=",style: TextStyle(color:isDark? Color(0xffFBFBFB): Color(0xff373737),
             
             fontSize: 26.sp,fontFamily: "Poppins",fontWeight: FontWeight.w600),)),
           ),
         ),
    
       ],),
     ),
             
               ],
             ),
             
            )
          ],
        )


      ],
    ),
  ),
);
  }
}

