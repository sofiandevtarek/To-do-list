import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  List<String> tasks = [];
  List<bool> checkboxValues = [];
  List<Color> textColors = [];
  List<TextDecoration> textDecoration = [];

  // create a new task function

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            width: 120,
            height: 200,
            child: Column(
              children: [
                CustomText(
                  text: 'Add your new task',
                  fontSize: 25.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(height: 20),
                TextFormField(
                  cursorColor: Colors.orange[800],
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.orange.shade800),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orange.shade800,
                        width: 1.5,
                      ),
                    ),
                    prefixIcon: Icon(Icons.edit, color: Colors.orange[800]),
                    hintText: 'Enter your new task',
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          tasks.add(controller.text);
                          checkboxValues.add(false);
                          textColors.add(Colors.white);
                          controller.clear();
                        });
                      },
                      color: Colors.teal,
                      minWidth: 100,
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomText(text: 'Add', fontSize: 20),
                    ),
                    SizedBox(width: 20),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {
                          controller.clear();
                        });
                      },
                      color: Colors.teal,
                      minWidth: 100,
                      height: 55,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: CustomText(text: 'Cancel', fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 35),
          child: CustomText(
            text: '${tasks.length}',
            color: Colors.tealAccent,
            fontSize: 25,
          ),
        ),
        title: CustomText(
          text: 'To Do List',
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                tasks.clear();
              });
            },
            icon: Icon(Icons.delete_forever, color: Colors.red, size: 30),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 25),
        width: double.infinity,
        child: ListView.builder(
          itemCount: tasks.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF314148),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomText(
                    text: tasks[index],
                    fontSize: 20,
                    color: textColors[index],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: checkboxValues[index],
                        onChanged: (value) {
                          setState(() {
                            checkboxValues[index] = value!;
                            if (value) {
                              textColors[index] = Colors.grey;
                            } else {
                              textColors[index] = Colors.white;
                            }
                          });
                        },
                        activeColor: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            tasks.remove(tasks[index]);
                          });
                        },
                        icon: Icon(Icons.delete, color: Colors.red, size: 25),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.orange[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
