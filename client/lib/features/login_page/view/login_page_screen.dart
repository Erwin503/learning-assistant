import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../sign_up_page/widgets/password_text_field_widgets.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.background
                // gradient: LinearGradient(
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                //   colors: [
                //     Theme.of(context).colorScheme.background,
                //     const Color.fromARGB(255, 126, 191, 244)
                //   ],
                // ),
                ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Вход",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "С возвращением",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          semanticsLabel: 'Logo',
                          width: 100.0,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 124, 6, 0.29),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade300))),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(255, 75, 91, 99)),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200))),
                              child: PasswordTextField(
                                label: 'Пароль',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/sign-up');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Нет аккаунта? ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 75, 91, 99)),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                bottom: 2, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.blue,
                                width: 1.0, // Underline thickness
                              ))),
                              child: Text(
                                "Зарегистрироваться?",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/');
                        },
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: Theme.of(context).colorScheme.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: Center(
                          child: Text(
                            "Войти",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
