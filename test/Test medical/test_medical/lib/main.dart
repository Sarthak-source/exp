import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(247, 246, 247, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(13, 81, 114, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
          ),
        ),
      ),
      home: const BottomNavigationBarExample(),
    );
  }
}

Widget flightShuttleBuilder(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  return DefaultTextStyle(
    style: DefaultTextStyle.of(toHeroContext).style,
    child: toHeroContext.widget,
  );
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    EditProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Apppointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Prrescription',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Edit Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(13, 81, 114, 1),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;

  final bool fullWidth;

  final double width;

  final void Function()? onPressed;

  final bool flat;

  const PrimaryButton(this.label,
      {super.key,
      this.fullWidth = false,
      this.width = 120,
      this.flat = false,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (flat) {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(13, 81, 114, 1),
          ),
        ),
      );
    }

    return SizedBox(
      width: fullWidth ? MediaQuery.of(context).size.width : width,
      child: CupertinoButton(
        borderRadius: const BorderRadius.all(Radius.zero),
        color: const Color.fromRGBO(13, 81, 114, 1),
        onPressed: onPressed,
        child: Text(
          label,
        ),
      ),
    );
  }
}

activeIcon() {
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: const BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    ),
    child: const Icon(
      Icons.check,
      size: 15,
      color: Colors.white,
    ),
  );
}

Widget inActiveIcon() {
  return Container(
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.white,
        width: 2,
      ),
    ),
    child: const Icon(
      Icons.check,
      size: 15,
      color: Colors.white,
    ),
  );
}

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    ProfileDetails(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 3: Business',
    ),
    Text(
      'Index 3: Business',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          "Detail",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 0 || _selectedIndex > 0
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              _onItemTapped(0);
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Location",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 1 || _selectedIndex > 1
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Locations()),
              );
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Week Slot",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 2 || _selectedIndex > 2
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Slot()),
              );
            },
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'Leading',
          child: IconTheme(
            data: Theme.of(context).primaryIconTheme,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.back,),
              ),
            ),
          ),
        ),
        title: const Hero(
            tag: 'AppBar',
            flightShuttleBuilder: flightShuttleBuilder,
            child: Text('Edit Profile')),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Hero(
              tag: 'Stepper',
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                iconWidth: 25,
                iconHeight: 25,
                activeBarColor: Colors.green,
                inActiveBarColor: Colors.white,
                inverted: true,
                verticalGap: 30,
                activeIndex: _selectedIndex,
                barThickness: 2,
              ),
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

class WhiteTextField extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const WhiteTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: leadingIcon != null ? Icon(leadingIcon) : null,
          suffixIcon: trailingIcon != null ? Icon(trailingIcon) : null,
        ),
      ),
    );
  }
}

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 29, vertical: 28),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 15,
                          color: Colors.black, // Customize the icon color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: 'John',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: 'Marshal',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: 'john.marshal@gmail.com',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: '07/05/1988',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: 'Jubliee insurance',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: 'AG123457',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: '9984939494',
              ),
              const SizedBox(
                height: 15,
              ),
              WhiteTextField(
                controller: controller,
                label: '',
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Hero(
                flightShuttleBuilder: flightShuttleBuilder,
                tag: 'Button',
                child: PrimaryButton(
                  'NEXT',
                  width: 200,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const Locations()),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Locations extends StatefulWidget {
  const Locations({super.key});

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  final _selectedIndex = 1;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          "Detail",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 0 || _selectedIndex > 0
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Location",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 1 || _selectedIndex > 1
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Locations()),
              );
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Week Slot",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 2 || _selectedIndex > 2
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Slot()),
              );
            },
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Hero(
          tag: 'Leading',
          child: IconTheme(
            data: Theme.of(context).primaryIconTheme,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.back),
              ),
            ),
          ),
        ),
        title: const Hero(
            tag: 'AppBar',
            flightShuttleBuilder: flightShuttleBuilder,
            child: Text('Edit Profile')),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Hero(
              flightShuttleBuilder: flightShuttleBuilder,
              tag: 'Stepper',
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                iconWidth: 25,
                iconHeight: 25,
                activeBarColor: Colors.green,
                inActiveBarColor: Colors.white,
                inverted: true,
                verticalGap: 30,
                activeIndex: _selectedIndex,
                barThickness: 2,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: WhiteTextField(
              controller: controller,
              label: '834 Country Club Rd',
              leadingIcon: Icons.search_outlined,
              trailingIcon: Icons.close_rounded,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Hero(
                    flightShuttleBuilder: flightShuttleBuilder,
                    tag: 'Button',
                    child: PrimaryButton(
                      'NEXT',
                      width: 200,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Slot()),
                        );
                      },
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

class Slot extends StatefulWidget {
  const Slot({super.key});

  @override
  State<Slot> createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  final _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    expantionList(String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Card(
          child: ExpansionTile(
            title: Text(
              title,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            children: <Widget>[
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.access_alarm),
                    Text(
                      '10:30 to 7:30',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(Icons.access_alarm),
                    Text(
                      '6:30 to 8:30',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          "Detail",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 0 || _selectedIndex > 0
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Location",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 1 || _selectedIndex > 1
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Locations()),
              );
            },
          ),
        ),
      ),
      StepperData(
        title: StepperText(
          "Week Slot",
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        iconWidget: Material(
          color: Colors.transparent,
          child: InkWell(
            child: _selectedIndex == 2 || _selectedIndex > 2
                ? activeIcon()
                : inActiveIcon(),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Slot()),
              );
            },
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
       leading: Hero(
          tag: 'Leading',
          child: IconTheme(
            data: Theme.of(context).primaryIconTheme,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(CupertinoIcons.back),
              ),
            ),
          ),
        ),
        title: const Hero(
            tag: 'AppBar',
            flightShuttleBuilder: flightShuttleBuilder,
            child: Text('Edit Profile')),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
            child: Hero(
              flightShuttleBuilder: flightShuttleBuilder,
              tag: 'Stepper',
              child: AnotherStepper(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                iconWidth: 25,
                iconHeight: 25,
                activeBarColor: Colors.green,
                inActiveBarColor: Colors.white,
                inverted: true,
                verticalGap: 30,
                activeIndex: _selectedIndex,
                barThickness: 2,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                expantionList('Monday'),
                expantionList('Tuesday'),
                expantionList('Wednesday'),
                expantionList('Thursday'),
                expantionList('Friday'),
                expantionList('Saturday'),
                expantionList('Sunday'),
              ],
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Hero(
                    flightShuttleBuilder: flightShuttleBuilder,
                    tag: 'Button',
                    child: PrimaryButton(
                      'SAVE',
                      width: 200,
                      onPressed: () {},
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
