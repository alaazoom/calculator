// List<String>inputList(String input){
//   List<String>inputs =[];
//   String number = "";
//   for(int i = 0 ; i< input.length ; i++) {
//     String x = input[i];
//     if("0123456789".contains(x)){
//       number=number+x;
//     }
//     else if("+-*/".contains(x)){
//       if(number.isEmpty&&x=="-"&&input.isEmpty||"+-*/".contains(inputs.last)){
//         number="-";
//       }else{
//         if(number.isNotEmpty){
//           inputs.add(number);
//           number="";
//         }
//         inputs.add(x);
//       }
//     }
//   }
//   if (number.isNotEmpty){
//     inputs.add(number);
//   }
//   return inputs;
// }

// ///////////////////////////////////////////////////////////////////////////////////
// List<String> handleMulDiv(List<String>inputList){
//   List<String>  result = [];
//   for(int i = 0 ; i<inputList.length ; i++){
//     String numOp = inputList[i];
//     if(numOp=="*"||numOp=="/"){
//       double previousNum = double.parse(result.removeLast());
//       double nextNum = double.parse(inputList[++i]);
//       double answer = numOp=="*"?previousNum*nextNum:previousNum/nextNum;
//       result.add(answer.toString());
//     }else{
//       result.add(numOp);
//     }
//     return result;
//   }




// ////////////////////////////////////////////////////////////////
// double handleAddSub(List<String>inputList){
//  double  result = double.parse(inputList[0]);
//   for(int i = 0 ; i<inputList.length ; i=i+2){
//     String numOp = inputList[i];
//     double nextNum = double.parse(inputList[++i]);
//     if(numOp=="+"){
//       result=result+nextNum;
//     }else if (numOp=="-"){
//       result=result-nextNum;
//     }
   
//   }


  
// }

//   return result;
  
// }
// //////////////////////////////////////////////////////////////////////////////
// String calculate (String input){
//   try{
//     input=input.replaceAll("from", "*").replaceAll("from", "/");
//     List<String>inputs=inputList(input);
//     inputs=handleMulDiv(inputs);
//     double result = handleAddSub(inputs);
//     print("result.toString()//////////////////////////////////////////////////////////////////////////////");
//     print(result.toString());
//    print("result.toString()//////////////////////////////////////////////////////////////////////////////");

//     return result.toString();


// }catch(e){

//       print("result.toString()//////////////////////////////////////////////////////////////////////////////");
//     print("ErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorErrorError/////////////////////////////////////////////////////////////////////////");
//     print("result.toString()//////////////////////////////////////////////////////////////////////////////");
//   return"error";
// }


// }




List<String> inputList(String input) {
  List<String> inputs = [];
  String number = "";
  for (int i = 0; i < input.length; i++) {
    String x = input[i];
   if ("0123456789.".contains(x)) {
  number += x;
}
    else if ("+-*/".contains(x)) {
      if (number.isEmpty &&
          x == "-" &&
          (i == 0 || (inputs.isNotEmpty && "+-*/".contains(inputs.last)))) {
        number = "-";
      } else {
        if (number.isNotEmpty) {
          inputs.add(number);
          number = "";
        }
        inputs.add(x);
      }
    }
  }
  if (number.isNotEmpty) {
    inputs.add(number);
  }

  return inputs;
}

///////////////////////////////////////////////////////////////////////////////////////
List<String> handleMulDiv(List<String> inputList) {
  List<String> result = [];

  for (int i = 0; i < inputList.length; i++) {
    String current = inputList[i];

    if (current == "*" || current == "/") {
      double previous = double.parse(result.removeLast());
      double next = double.parse(inputList[++i]);

      double answer =
          current == "*" ? previous * next : previous / next;

      result.add(answer.toString());
    } else {
      result.add(current);
    }
  }

  return result;
}

//////////////////////////////////////////////////////////////////////////////
double handleAddSub(List<String> inputList) {
  double result = double.parse(inputList[0]);

  for (int i = 1; i < inputList.length; i += 2) {
    String op = inputList[i];
    double next = double.parse(inputList[i + 1]);

    if (op == "+") {
      result += next;
    } else if (op == "-") {
      result -= next;
    }
  }

  return result;
}
///////////////////////////////////////////////////////////////////////////////////////////////
String calculate(String input) {
  try {
 
   input = input
    .replaceAll("×", "*")  
    .replaceAll("÷", "/");


    List<String> inputs = inputList(input);


    inputs = handleMulDiv(inputs);

    
    double result = handleAddSub(inputs);
            print("result.toString()//////////////////////////////////////////////////////////////////////////////");
print(result.toString());
   print("result.toString()//////////////////////////////////////////////////////////////////////////////");



    if (result.isInfinite || result.isNaN) {
  return "error";
}


if (result.abs() > 1e12) {
  return "Too Big !";
}


if (result % 1 == 0) {
  return result.toInt().toString();
} else {
  return result.toString();
}

  } catch (e) {
            print("result.toString()//////////////////////////////////////////////////////////////////////////////");

   print("result.toString()//////////////////////////////////////////////////////////////////////////////");


    return "error";
  }
}