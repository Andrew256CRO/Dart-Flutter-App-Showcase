void main(){

  taskProblems();

}

void taskProblems() async{ // async gives me access to 'await'
  task1();
  dynamic task2Var = await task2(); 
  print(task2());
  print(task2Var);
  task3(task2Var);
}

void task1(){
  //String result='task 1 data';
  print('Task 1 com');
}


// Task 3 se va executa duap finish a taskului 2
Future <String> task2() async {
  Duration durata = Duration(seconds: 3); // create a duration object
  // syncro delay
  //sleep(durata); //'sleeps' for that duration

  String result;

  //async delay
  await Future.delayed(durata, (){
      print('Task 2 com');
  }); // returns a future

   result='task 2 data';

  return result;

}



void task3(String datainp){
   //String result='task 3 data';
  print('Task 3 com $datainp');
}