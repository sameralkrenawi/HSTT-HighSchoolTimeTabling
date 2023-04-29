import 'package:flutter/material.dart';
import 'package:timetabler/AdminPages/ScheduleSearchScreen.dart';
import 'package:timetabler/registration/Login.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../AdminPages/AddTeacher.dart';
import '../AdminPages/AddStudent.dart';
import '../AdminPages/AddSubject.dart';
import '../AdminPages/AddRoom.dart';
import '../AdminPages/OtherActions.dart';
import '../MaxSat/SchedulePage.dart';


class AfterLogin extends StatelessWidget {

  ParseUser? currentUser;
  @override
  Widget build(BuildContext context) {
    void doUserLogout() async {
      var response = await currentUser!.logout();
      if (response.success) {
        Message.showSuccess(
            context: context,
            message: 'User was successfully logout!',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false,
              );
            });
      } else {
        Message.showError(context: context, message: response.error!.message);
      }
    }
    return 
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('./assets/login.png'), fit: BoxFit.cover),
        ),

    child :Scaffold(
          appBar: AppBar(
            title: Text('עמוד מנהל בית הספר'),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('אפשרויות'),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.add,
                  ),
                  title: const Text('הוספת נושא'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Subject(),));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.add,
                  ),
                  title: const Text('הוספת מורה'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const TeacherUser(),));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.add,
                  ),
                  title: const Text('הוספת תלמיד'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Student(),));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.add,
                  ),
                  title: const Text('הוספת כיתה'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Room(),));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: const Text('יציאה'),
                  onTap: () {
                    doUserLogout();
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Login()));
                  },
                ),
              ],
            ),
          ),
                body: ListView(
        children: <Widget>[
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('הוספת נושא'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const Subject()),
              );
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('הוספת מורה'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const TeacherUser()),
              );
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('הוספת תלמיד'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => const Student()),
              );
            },
          ),
          // SizedBox(height: 25),
          // ListTile(
          //   leading: Icon(Icons.add),
          //   title: Text('By room'),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder:(context) => ScheduleSearchScreen(schedules: schedule,)),
          //     );
          //   },
          // ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('הוספת כיתה'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => Room()),
              );
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('צפייה במערכת שעות של המורים'),
            onTap: () {
                          Navigator.push(
              context,
MaterialPageRoute(
  builder: (context) =>
  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/back.png'), fit: BoxFit.cover),
      ),
  child :Scaffold(
    appBar: AppBar(
      title: const Text('מערכת שעות'),
    ),
    body: ListView.builder(
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              'Teacher: ${schedule[index].teacher.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Subject: ${schedule[index].subject}\nClassroom: ${schedule[index].classroom.name}\nDay: ${schedule[index].day}\nHour: ${schedule[index].hour}:00 to ${schedule[index].hour+1}:00',
            ),
          ),
        );
      },
    ),
  ),
)
),

            );
            },
          ),
          SizedBox(height: 25),
          ListTile(
            leading: Icon(Icons.more_horiz),
            title: Text('...פעולות נוספות'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => OtherActions()),
              );
            },
          ),
        ]
        
          ))

      );

  }
  
}
class Message {
  static void showSuccess(
      {required BuildContext context,
        required String message,
        VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success!"),
          content: Text(message),
          actions: <Widget>[
            new ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }

  static void showError(
      {required BuildContext context,
        required String message,
        VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(message),
          actions: <Widget>[
            new ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
