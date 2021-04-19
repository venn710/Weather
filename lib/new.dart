import 'dart:io';
void main()
{
performTasks();
}
 void performTasks()
 {
  Task1();
   Task2();
   Task3();
 }
  void Task1()
  {
    print("task1");
  }
  void Task2()
  {
    Duration d=new Duration(seconds:3);
    sleep(d);
    print("task2");
  }
  void Task3()
  {
    print("task3");
  }