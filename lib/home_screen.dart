import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController? _textEditingController =TextEditingController();
 List<String> foodListOnSearch = [];
  List<String> foodList = [
        "Task",
        "Apple",
        "Pizza",
        "Android",
        "Flutter",
        "Kotlin",
        "Java",
        "Python",
    "Cheese",
    "Android Studio",
    "Visual Studio Code",
    "Ruby",
    "Dart",
    "Cheesy Pizza",
    "Cheesy Pizza",
    "Cheesy Pizza",
    "Apple",
    "Pizza",
    "Android",
    "Flutter",
    "Kotlin",
    "Java",
    "Python"

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: 30,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white
            ,borderRadius: BorderRadius.circular(30)),

            child: TextField(
              onChanged: (value){
                setState(() {
                  foodListOnSearch = foodList
                      .where((element) => element.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              controller: _textEditingController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(10),
                hintText: ('Search'),

              ),
            ),
          ),
        ) ,
      ),
      body: _textEditingController! .text.isNotEmpty && foodListOnSearch.isEmpty
        ?Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: const [
               Icon(Icons.search_off,size: 80,),
              Text("No result found",style: TextStyle(fontSize: 20),),
            ],
          ),
        )
      :ListView.builder(
        itemCount: _textEditingController!.text.isNotEmpty? foodListOnSearch.length:foodList.length,
          itemBuilder: (context, index) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset("images/Ellipse 33.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              _textEditingController!.text.isNotEmpty
                  ? foodListOnSearch[index]
               : foodList[index],
            ),
          ],
    );
      }


      ),
    );
  }
}