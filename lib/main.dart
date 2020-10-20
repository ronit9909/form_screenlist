import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:form_screenlist/DataList.dart';
import 'DataList.dart';


bool _showAppbar = false;
bool _ismenselected = true;

enum Gender { Male, Female }
Gender character = null;
void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,//
      body: Stack(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(
                image: AssetImage('assets/background_image_one_signin.png'),
                fit: BoxFit.fill,
              )
            // child: B,
          ),
          ListView(
            children: <Widget>[
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          iconSize: 20,
                          color: Colors.white,
                          // splashColor: Colors.purple,
                          onPressed: () {},
                        ),
                      ),
                      Container(
                        // height: 20,
                        padding: EdgeInsets.fromLTRB(25, 95, 40, 0),
                        margin: EdgeInsets.all(1.0),
                        width: 190,
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                          // overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(40, 102, 40, 0),
                        child:  TextFormField( decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(),
                            hintText: 'Email'
                        ),
                          autofocus: false,
                          obscureText: false,
                        ), // Example
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child:  TextFormField( decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(),
                            hintText: 'Password'

                        ),
                          autofocus: false,
                          obscureText: true,
                        ), // Example
                      ),
                      Container(
                          height: 120,
                          color: Colors.transparent,
                          //margin: EdgeInsets.only(bottom: 0.0),
                          // alignment: Alignment.bottomCenter ,
                          padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 10.0,top: 29.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '  Sign In ',
                                style: TextStyle(fontSize: 25,
                                    fontWeight:FontWeight.bold,
                                    color: Color.fromRGBO(78, 84, 95, 1)
                                ),
                              ),
                              ButtonTheme(
                                minWidth:80,
                                height: 80,
                                child:RaisedButton(
                                  shape: CircleBorder(),
                                  textColor: Colors.white,
                                  color: Colors.white,
                                  child: Image.asset("assets/right_arrow_in_a_circle.png",width: 82,height: 82,),
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                    Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) => EmployeePage()));
                                    // print(nameController.text);
                                    //print(passwordController.text);
                                  },
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                      ),
                      Container(

                          alignment: Alignment.bottomCenter ,
                          padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 20.0,top: 45.0),
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                textColor: Color.fromRGBO(78, 84, 95, 1),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(fontSize: 18,
                                    fontWeight:FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(78, 84, 95, 1),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                                  Navigator.of(context, rootNavigator: true).pushReplacement(MaterialPageRoute(builder: (context) =>  emplo()));
                                  //signup screen
                                },
                              ),
                              FlatButton(
                                textColor: Colors.black,
                                child: Text(
                                  'Forgot Passwords?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight:FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(78, 84, 95, 1),
                                  ),
                                ),
                                onPressed: () {
                                  //signup screen
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                      ),
                    ]),
              ),
            ],
          )
        ],
      ),

    );
  }
}


class SignUpPage extends StatelessWidget {
  var  countrycode = '';
  var  countryname = '';
  TextEditingController dateCtl = TextEditingController();
  final number = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return  null;
  }
  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(

              width: double.infinity,
              height: double.infinity,

              child: Image(
                image: AssetImage('assets/background_image_one_signup.png'),
                fit: BoxFit.fill,

              )
            // child: B,
          ),
          ListView(
            children: <Widget>[
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2),
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                          ),
                          iconSize: 20,
                          color: Colors.white,
                          // splashColor: Colors.purple,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          },
                        ),
                      ),
                      Container(
                        // height: 20,
                        padding: EdgeInsets.fromLTRB(25, 65, 40, 0),
                        margin: EdgeInsets.all(1.0),
                        width: 190,
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                          // overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child:  TextFormField(
                          // controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                            // border: InputBorder.none,
                            labelText: 'Name',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                          ),
                          obscureText: false,
                          autofocus: false,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 15, 40, 0),
                        child:   TextFormField(
                          keyboardType: TextInputType.emailAddress ,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          key: _formKey,
                          validator: validateEmail,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                            // border: InputBorder.none,
                            labelText: 'Email',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          // validator: (email)=>validateEmail(email)? null:"Invalid email address",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child:  TextFormField(
                          // controller: passwordController,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                            // border: InputBorder.none,
                            labelText: 'Password',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                          ),
                          autofocus: false,
                          obscureText: true,
                        ),
                      ),
                      Container(
                        height: 55,
                        padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 10.0,top: 25.0),
                        child: Row(
                          children: <Widget>[
                            Radio(

                              activeColor: Colors.white,
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              value: Gender.Male,
                              groupValue: character,
                              onChanged: (Gender value) {

                                setStateMale(() {
                                  print("Radio male called");
                                  character = Gender.Male;
                                });
                              },
                            ),
                            Text(
                              'MALE',
                              style: new TextStyle(fontSize: 17.0,color: Colors.white),
                            ),
                            Radio(

                              activeColor: Colors.white,
                              // focusColor: Colors.white,
                              // hoverColor: Colors.white,
                              value: Gender.Female,
                              groupValue: character,
                              onChanged: (Gender value) {

                                setStateFemale(() {
                                  print("Radio female called");
                                  character = Gender.Male;
                                });
                              },
                            ),
                            Text(
                              'FEMALE',
                              style: new TextStyle(fontSize: 17.0,color: Colors.white),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                      Container(
                        height:  50,
                        padding: EdgeInsets.only(bottom: 5.0,left: 30.0,right: 10.0,top: 0.0),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Select Language',
                          style: new TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),

                        ),
                      ),

                      Container(
                        // padding: new EdgeInsets.all(18.0),
                          height:  185,
                          padding: EdgeInsets.only(bottom: 10.0,left: 30.0,right: 10.0,top: 5.0),
                          // alignment: Alignment.bottomLeft,
                          child: Column(
                              children: <Widget>[
                                // SizedBox(height: 10,),
                                CheckboxListTile(
                                  title: const Text(
                                      'English',
                                      style:  TextStyle(fontSize: 20.0,color: Colors.white)),
                                  value: true,
                                  onChanged: (bool value) {
                                    setState(() {
                                      // this.valuefirst = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  title: const Text(
                                      'Hindi',
                                      style:  TextStyle(fontSize: 20.0,color: Colors.white)),

                                  value: false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      // this.valuesecond = value;
                                    });
                                  },
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  title: const Text(
                                      'Gujarati',
                                      style:  TextStyle(fontSize: 20.0,color: Colors.white)),
                                  value: false,
                                  onChanged: (bool value) {
                                    setState(() {
                                      // this.valuesecond = value;
                                    });
                                  },
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start
                          )
                      ),
                      Container(
                          height:  30,
                          padding: EdgeInsets.only(bottom: 5.0,left: 30.0,right: 10.0,top: 0.0),
                          alignment: Alignment.bottomLeft,
                          child: Text(
                          'Select Country',
                          style: new TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          ),

                      Container(
                          padding:EdgeInsets.all(15),

                          height:80,
                          alignment: Alignment.centerLeft,
                          child: Card(
                              child:Padding(
                                padding: EdgeInsets.all(2),
                                child:SizedBox(
                                  height: double.infinity,
                                  width:double.infinity,
                                  child:CountryListPick(
                                    // isShowFlag: true, //show flag on dropdown
                                    // isShowTitle: true, //show title on dropdown
                                    // isShowCode: true, //show code on dropdown
                                    // isDownIcon: true, //show down icon on dropdown
                                    initialSelection: '+672', //inital selection, +672 for Antarctica
                                    onChanged: (CountryCode code) {
                                      print(code.name); //get the country name eg: Antarctica
                                      print(code.code); //get the country code like AQ for Antarctica
                                      print(code.dialCode); //get the country dial code +672 for Antarctica
                                      print(code.flagUri); //get the URL of flag. flags/aq.png for Antarctica
                                     countrycode = code.code;
                                     countryname = code.name;
                                    },
                                  ),
                                ),
                              )
                          )
                      ),
                      Container(
                        height:  30,
                        padding: EdgeInsets.only(bottom: 5.0,left: 30.0,right: 10.0,top: 0.0),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Select Date Of Birth',
                          style: new TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height:  50,
                        padding: EdgeInsets.fromLTRB(30, 15, 40, 0),
                        child:  TextFormField(
                          readOnly: true,
                          controller: dateCtl,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                            // labelText: "Date of birth",
                            hintText: "Select Date",
                            // labelText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          onTap: () async{
                            DateTime date = DateTime(1900);
                            FocusScope.of(context).requestFocus(new FocusNode());

                            date = await showDatePicker(
                                context: context,
                                initialDate:DateTime.now(),
                                firstDate:DateTime(1900),
                                lastDate: DateTime(2100));
                            dateCtl.text = "${date.day}-${date.month}-${date.year}";},
                        )
                      ),
                      Container(
                        height:  50,
                        padding: EdgeInsets.only(bottom: 5.0,left: 30.0,right: 10.0,top: 0.0),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Enter Mobile number',
                          style: new TextStyle(fontSize: 20.0,color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height:  50,
                        padding: EdgeInsets.only(bottom: 5.0,left: 30.0,right: 10.0,top: 0.0),
                        alignment: Alignment.bottomLeft,
                        child:  TextFormField(
                          controller: number,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,width: 1.0),
                            ),
                            // labelText: "Date of birth",
                            hintText: "Mobile number",
                            // labelText: 'Mobile Number',
                            hintStyle: TextStyle(color: Colors.white),
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          obscureText: false,
                          autofocus: false,
                        ),
                      ),
                      Container(

                          height: 120,

                          //margin: EdgeInsets.only(bottom: 0.0),
                          // alignment: Alignment.bottomCenter ,
                          padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 10.0,top: 35.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                '  Sign Up ',
                                style: TextStyle(fontSize: 25,
                                    fontWeight:FontWeight.bold,
                                    // color: Color.fromRGBO(81, 87, 96, 1)
                                    color:  Colors.white
                                ),
                              ),
                              ButtonTheme(
                                minWidth:81,
                                height: 81,

                                child:RaisedButton(
                                  shape: CircleBorder(),
                                  textColor: Colors.transparent,
                                  color: Colors.white,
                                  child: Image.asset("assets/right_arrow_in_a_circle.png",width: 82,height: 82,),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
                                      _formKey.currentState.save();
                                    } else {
//    If all data are not valid then start auto validation.
                                      setState(() {
                                        // _autoValidate = true;
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                      ),
                      Container(

                          alignment: Alignment.bottomCenter ,
                          padding: EdgeInsets.only(bottom: 10.0,left: 19.0,right: 20.0,top: 40.0),
                          child: Row(
                            children: <Widget>[
                              FlatButton(
                                textColor: Colors.white,
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(fontSize: 18,
                                      fontWeight:FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.white
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                  //signup screen
                                },
                              ),

                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                      ),
                    ]),
              ),
            ],
          )
        ],
      ),

    );
  }

  void setStateMale(Null Function() param0)
  {
    print("Radio $character");
    _ismenselected = true;
    setupdategender();

  }

  void setStateFemale(Null Function() param0) {
    print("Radio female called");
    bool _ismenselected = false;
    setupdategender();

  }

  void setupdategender() {
    if (_ismenselected)
    {

    }
    else
    {

    }
  }
  void setState(Null Function() param0) {
  }

}




