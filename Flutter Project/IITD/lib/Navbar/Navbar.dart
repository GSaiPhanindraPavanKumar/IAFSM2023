import 'package:flutter/material.dart';


class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>1280) {
          return DesktopNavbar();
        } else if(constraints.maxWidth>800 && constraints.maxWidth<1280) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
        child: Container(
          constraints: BoxConstraints(maxWidth: 1280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "IIT Energy Meter",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Meter 1",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Meter 2",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  MaterialButton(
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: (){},
                    child: Text(
                      "IAFSM",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
      child: Container(
        child: Column(
          children: <Widget>[
            Text(
              "IIT Energy Meter",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Meter 1",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Meter 2",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}