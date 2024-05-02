import 'package:education_app/features/group_page/widgets/lesson_item.dart';
import 'package:flutter/material.dart';
import '../../../models/course.dart';
import '../../data.dart';

class GroupPageScreen extends StatefulWidget {
  @override
  _GroupPageScreenState createState() => _GroupPageScreenState();
}

class _GroupPageScreenState extends State<GroupPageScreen> {
  void _showTimeInputModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: TimeInputForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF007171),
        toolbarHeight: 36,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 4),
        child: FloatingActionButton(
          onPressed: () => _showTimeInputModal(context),
          backgroundColor: Color(0xFF007171),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(
        children: [
          GroupHeader(),
          Expanded(child: GroupScreen()),
        ],
      ),
    );
  }
}

class GroupHeader extends StatelessWidget {
  const GroupHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 12),
      height: 72,
      decoration: BoxDecoration(
        color: Color(0xFF007171),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.0),
          bottomRight: Radius.circular(24.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: Icon(Icons.people, size: 32, color: Colors.white)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Название группы',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              Text(
                'Автор Ганиев Ибраим',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GroupScreen extends StatelessWidget {
  const GroupScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text("Занятия",
                style: Theme.of(context).textTheme.displayLarge),
          ),
          Expanded(
            child: FutureBuilder<List<Course>>(
              future: Future.value(CourseData.coursesList),
              // future: ApiService().fetchCourses(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: const CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  print(snapshot.data);

                  return ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.of(context).pushNamed(
                          //   '/course',
                          //   arguments: index,
                          // );
                        },
                        child: LessonItem(),
                      );
                    },
                  );
                } else {
                  return Text('No data available');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TimeInputForm extends StatefulWidget {
  @override
  _TimeInputFormState createState() => _TimeInputFormState();
}

class _TimeInputFormState extends State<TimeInputForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  String _selectedDay = 'Понедельник';

  @override
  void dispose() {
    _startTimeController.dispose();
    _endTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "Начало занятия",
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
              child: TextFormField(
                controller: _startTimeController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                  border: InputBorder.none,
                  hintText: '08:00',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Поле пустое, введите начало занятия';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Конец занятия",
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 12.0),
              child: TextFormField(
                controller: _endTimeController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color.fromARGB(255, 75, 91, 99)),
                  border: InputBorder.none,
                  hintText: '10:00',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Поле пустое, введите конец занятия';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "День недели",
                textDirection: TextDirection.ltr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 20.0, bottom: 8.0, right: 20),
              child: DropdownButtonFormField<String>(
                dropdownColor: Color.fromARGB(255, 253, 253, 253),
                value: _selectedDay,
                items: <String>[
                  'Понедельник',
                  'Вторник',
                  'Среда',
                  'Четверг',
                  'Пятница',
                  'Суббота',
                  'Воскресенье'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedDay = newValue!;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Процесс сохранения данных или их использования
                      print('Start Time: ${_startTimeController.text}');
                      print('End Time: ${_endTimeController.text}');
                      print('Day of Week: $_selectedDay');
                    }
                  },
                  child: Text(
                    'Сохранить',
                    style: TextStyle(color: Color.fromARGB(255, 13, 110, 89)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
